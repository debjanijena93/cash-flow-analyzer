const cds = require('@sap/cds');
const csv = require('csv-parser') // or use 'papaparse' for browser-side parsing
const fs = require('fs')
const { Readable } = require('stream');

async function parseCSV(file) {
    return new Promise((resolve, reject) => {
        const results = []

        // Create a read stream from the buffer
        const stream = require('stream')
        const bufferStream = new stream.PassThrough()
        bufferStream.end(file.buffer)

        bufferStream
            .pipe(csv())
            .on('data', (data) => results.push(data))
            .on('end', () => resolve(results))
            .on('error', (error) => reject(error))
    })
}


module.exports = cds.service.impl(async function (srv) {

    srv.on('updateProcessingStatus', async (req) => {

        const { openItemsStagingTable } = cds.entities('app.openitems');
        const tx = cds.transaction(req);

        await tx.run(
            UPDATE(openItemsStagingTable)
                .set({ processingStatus: req.data.processingStatus })
                .where({ runID: req.data.runID }))

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
            const maxSeqNoResult = await SELECT.one`max(seqNo) as maxSeqNo`
                .from(OpenItemsStagingTable)
                .where({ runID: runID });

            let currentSeqNo = maxSeqNoResult ? maxSeqNoResult.maxSeqNo + 1 : 1;

            // Transform records with sequential seqNo
            const transformedRecords = records.map(record => ({
                runID: runID,
                seqNo: currentSeqNo++,
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

            const db = await cds.connect.to("db");
            const runID = new SequenceHelper({
                db: db,
                sequence: "RUN_ID",
                table: "OpenItemsStagingTable",
                field: "runID"
            });

            let ID = await runID.getNextNumber();

            const csvFilePath = 'inputfiles/inputfile1.csv'; // or provide path relative to project root


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
            const lastRunID = await SELECT.one`max(runID) as lastRunID`
                .from(OpenItemsStagingTable);

            var currentSeqNo = 1;

            // Transform and insert records into the entity
            const transformedRecords = records.map(record => ({
                // Map CSV fields to entity fields
                runID: runID,
                seqNo: currentSeqNo++,
                field1: record.csvField1,
                field2: parseInt(record.csvField2),
                // ... etc
            }));

            await INSERT.into(OpenItemsStagingTable).entries(transformedRecords);

            return { message: `${records.length} records imported successfully` };
        } catch (error) {
            req.error(500, `Error importing CSV: ${error.message}`);
        }


    })
})
