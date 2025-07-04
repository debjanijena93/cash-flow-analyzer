const cds = require('@sap/cds');
const csv = require('csv-parser') // or use 'papaparse' for browser-side parsing
const fs = require('fs')
const { Readable } = require('stream');

let rejectedEntries = [];

function cleanNumber(value) {
    if (!value) return 0;

    // Handle negative numbers in parentheses
    const isNegative = value.startsWith('(') && value.endsWith(')');
    const cleaned = value
        .replace(/[(),]/g, '')  // Remove parentheses
        .replace(/[^\d.-]/g, '') // Remove all non-numeric except . and -
        .replace(/,/g, '');      // Remove all commas

    const numberValue = parseFloat(cleaned) || 0;
    return isNegative ? -numberValue : numberValue;
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

    /*srv.on('uploadCSV', async (req) => {
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
    });*/

    srv.on('importCSV', async (req) => {// Get the uploaded file

        let transformedRecords;
        try {

            const csvFilePath = './srv/datafiles/openitems_inputfile.csv'; // or provide path relative to project root

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
            absoluteValue = records[0]['Absolute Value'];
            // Transform and insert records into the entity
            transformedRecords = records.map(record => ({
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
                absoluteValue: cleanNumber(record['Absolute Value']),
                usdAmount: cleanNumber(record['USD Amount']),
                days: record['Days'],
                agingBracket: record['Aging Bracket']
            }));

            await INSERT.into(OpenItemsStagingTable).entries(transformedRecords);

            return { message: `${records.length} records imported successfully` };
        } catch (error) {
            req.error(500, `Error importing CSV: ${error.message}`);
        }


    });

    srv.on('updateMatchedOpenItems', async (req) => {

        let transformedRecords;
        try {

            const csvFilePath = './srv/datafiles/matchedopenitems.csv'; // or provide path relative to project root

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
            const { MatchedOpenItems } = cds.entities;

            // Transform and insert records into the entity
            transformedRecords = records.map(record => ({
                // Map CSV fields to entity fields
                runID: record['runID'],
                seqNo: record['seqNo'],
                documentDate: formatDate(record['documentDate']),
                postingDate: formatDate(record['postingDate']),
                entryDate: formatDate(record['entryDate']),
                documentType: record['documentType'],
                profitCenter: record['profitCenter'],
                reference: record['reference'],
                referenceKey2: record['referenceKey2'],
                assignment: record['assignment'],
                documentHeaderText: record['documentHeaderText'],
                text: record['text'],
                postingKey: record['postingKey'],
                documentCurrency: { code: record['documentCurrency']?.trim() },
                amountInDocCurr: cleanNumber(record['amountInDocCurr']),
                localCurrency: { code: record['localCurrency']?.trim() },
                amountInLocalCurrency: cleanNumber(record['amountInLocalCurrency']),
                companyCode: record['companyCode'],
                yearMonth: record['yearMonth'],
                documentNumber: record['documentNumber'],
                account: record['account'],
                username: record['username'],
                postingPeriod: record['postingPeriod'],
                absoluteValue: cleanNumber(record['absoluteValue']),
                usdAmount: cleanNumber(record['usdAmount']),
                days: record['days'],
                agingBracket: record['agingBracket'],
                matchFound: record['matchFound'] === 'X',
                matchID: record['matchID'],
                matchSeq: record['matchSeq'],
                matchConfidence: record['matchConfidence'],
                matchRemarks: record['matchRemarks'],
                matchStatus: record['matchStatus'],
                matchDate: formatDate(record['matchDate']),
                nature: record['nature'],
                teamOrArea: record['teamOrArea'],
                personInCharge: record['personInCharge']
            }));

            await INSERT.into(MatchedOpenItems).entries(transformedRecords);

            return { message: `${records.length} records imported successfully` };
        } catch (error) {
            req.error(500, `Error importing CSV: ${error.message}`);
        }


    });

    srv.on('refreshTables', async (req) => {

        const { OpenItemsStagingTable, MatchedOpenItems, ClearingData } = cds.entities('app.openitems');
        const tx = cds.transaction(req);

        if (req.data.table === 1) {
            await tx.run(
                DELETE(OpenItemsStagingTable)
            );

        } else if (req.data.table === 2) {
            await tx.run(
                DELETE(MatchedOpenItems)
            );

        } else if (req.data.table === 3) {
            await tx.run(
                DELETE(ClearingData)
            );

        } else if (req.data.table === 4) {
            await tx.run(
                DELETE(OpenItemsStagingTable)
            );
            await tx.run(
                DELETE(MatchedOpenItems)
            );
            await tx.run(
                DELETE(ClearingData)
            );
        }
    });

    srv.on('rejectMatchedEntry', async (req) => {

        try {

            const { runID, seqNo } = req.params[0];
            const tx = cds.transaction(req);
            const { MatchedOpenItems } = cds.entities('app.openitems');

            var entryToReject = await cds.run(SELECT.from(MatchedOpenItems).where({
                runID: runID,
                seqNo: seqNo,
                matchFound: true
            }));

            if (entryToReject.length > 0) {
                var matchingEntries = await cds.run(SELECT.from(MatchedOpenItems).where({
                    matchID: entryToReject[0]?.matchID,
                    matchFound: true
                }));

                matchingEntries.forEach(entry => {
                    entry.rejectionComment = req.data.rejectionComment
                    entry.rejectedBy = req.user.id
                    entry.matchFound = false
                });

                await tx.run(
                    UPSERT.into(MatchedOpenItems).entries(matchingEntries)
                );
            }
        } catch (error) {
            console.log(error);
        }
    })


})
