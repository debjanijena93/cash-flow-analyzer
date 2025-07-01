const cds = require('@sap/cds');
const csv = require('csv-parser') // or use 'papaparse' for browser-side parsing
const fs = require('fs')
const { Readable } = require('stream');


function cleanNumber(value) {
    if (!value) return 0;
    const cleaned = value.toString()
        .replace(/[(),]/g, '')  // Remove parentheses (used for negative numbers)
        .replace(/[^\d.-]/g, ''); // Remove all non-numeric except . and -
    return parseFloat(cleaned) || 0;
}

function formatDate(dateStr) {
    if (!dateStr) return null;
    // Assuming format 'DD/MM/YY' or 'DD/MM/YYYY'
    const [day, month, year] = dateStr.split('/');
    const fullYear = year.length === 2 ? `20${year}` : year;
    return new Date(`${fullYear}-${month}-${day}`);
}

module.exports = cds.service.impl(async function (srv) {

    srv.on('updateProcessingStatus', async (req) => {

        const { OpenItemsStagingTable } = cds.entities('app.openitems');
        const tx = cds.transaction(req);

        /*        await tx.run(
                    UPDATE(openItemsStagingTable)
                        .set({ processingStatus: req.data.processingStatus })
                        .where({ runID: req.data.runID }))*/

        try {
            // Process each item sequentially
            for (const item of req.data.items) {
                await tx.run(
                    UPDATE(OpenItemsStagingTable)
                        .set({ processingStatus: item.processingStatus })
                        .where({ runID: item.runID })
                );
            }
            await tx.commit();
            return {};
        } catch (error) {
            await tx.rollback();
            console.error('Update failed:', error);
            return req.error(500, 'Failed to update processing status');
        }

    })

    srv.on('uploadCSV', async (req) => {
        try {
            const { file } = req.data;

            if (!file || !file.length) {
                return req.error(400, 'No file uploaded');
            }

            // Convert the file buffer to a readable stream
            const fileBuffer = Buffer.from(file, 'base64');
            const readableStream = Readable.from(fileBuffer.toString());

            // Read and parse the CSV file
            const records = await new Promise((resolve, reject) => {
                const results = [];
                readableStream
                    .pipe(csv())
                    .on('data', (data) => results.push(data))
                    .on('end', () => resolve(results))
                    .on('error', (error) => reject(error));
            });

            // Get the current maximum seqNo for this runID
            const { OpenItemsStagingTable } = cds.entities;

            const tx = cds.transaction(req)
            const maxRunID = await tx.run(
                SELECT.one.from('OpenItemsStagingTable')
                    .columns('max(runID) as maxID'))

            maxRunID = maxRunID ? maxRunID + 1 : 1;

            let currentSeqNo = 1;

            // Transform records with sequential seqNo
            const transformedRecords = records.map(record => ({
                runID: runID,
                seqNo: currentSeqNo++,
                //documentDate : 
                // Map other CSV fields to entity fields
                // Example:
                // field1: record.column1,
                // field2: parseInt(record.column2),
                // ... etc
            }));

            await INSERT.into(OpenItemsStagingTable).entries(transformedRecords);

            return {
                message: 'File imported successfully',
                runID: runID,
                firstSeqNo: currentSeqNo - records.length,
                lastSeqNo: currentSeqNo - 1,
                totalRecords: records.length
            };
        } catch (error) {
            console.error('Import error:', error);
            return req.error(500, `Error importing CSV: ${error.message}`);
        }
    });

    srv.on('importCSV', async (req) => {// Get the uploaded file


        try {

            const csvFilePath = './srv/datafiles/inputfile2.csv'; // or provide path relative to project root

            // Read and parse the CSV file
            const records = await new Promise((resolve, reject) => {
                const results = [];
                fs.createReadStream(csvFilePath)
                    .pipe(csv())
                    .on('data', (data) => results.push(data))
                    .on('end', () => resolve(results))
                    .on('error', (error) => reject(error));
            });

            // Get the current maximum seqNo for this runID
            const { OpenItemsStagingTable } = cds.entities;
            const tx = cds.transaction(req)
            const maxRunIDResult = await tx.run(
                SELECT.one.from(OpenItemsStagingTable)
                    .columns('max(runID) as maxID'))

            var runID = (maxRunIDResult?.maxID ?? 0) + 1;


            var currentSeqNo = 1;

            // Transform and insert records into the entity
            const transformedRecords = records.map(record => ({
                // Map CSV fields to entity fields
                runID: runID,
                seqNo: currentSeqNo++,
                documentDate: formatDate(record['Document Date']),
                postingDate: formatDate(record['Posting Date']),
                //documentDate: record['Document Date'],
                //postingDate: record['Posting Date'],
                entryDate: formatDate(record['Entry Date']),
                documentType: record['Document Type'],
                profitCenter: record['Profit Center'],
                reference: record['Reference'],
                referenceKey2: record['Reference Key 2'],
                assignment: record['Assignment'],
                documentHeaderText: record['Document Header Text'],
                text: record['Text'],
                postingKey: record['Posting Key'],
                documentCurrency: { code: record['Document currency']?.trim() },
                amountInDocCurr: cleanNumber(record['Amount in doc. curr.']),
                //localCurrency: record['Local Currency'],
                //amountInLocalCurrency: record['Amount in local currency'],
                localCurrency: { code: record['Local Currency']?.trim() },
                amountInLocalCurrency: cleanNumber(record['Amount in local currency']),
                companyCode: record['Company Code'],
                yearMonth: record['Year/month'],
                documentNumber: record['Document Number'],
                account: record['Account'],
                username: record['User name'],
                postingPeriod: record['Posting Period'],
                absoluteValue: record['Absolute Value'],
                usdAmount: record['USD Amount'],
                days: record['Days'],
                agingBracket: record['Aging Bracket']
            }));

            await INSERT.into(OpenItemsStagingTable).entries(transformedRecords);

            return { message: `${records.length} records imported successfully` };
        } catch (error) {
            req.error(500, `Error importing CSV: ${error.message}`);
        }


    })
})
