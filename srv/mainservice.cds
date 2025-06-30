using app.openitems from '../db/openitems';

service mainService {

    entity OpenItemsStagingTable as projection on openitems.OpenItemsStagingTable;
    entity MatchedOpenItems      as projection on openitems.MatchedOpenItems;

    action updateProcessingStatus(runID : String,
                                  processingStatus : String) returns {};

    action uploadCSV(file: LargeBinary)                     returns String;
    action importCSV() returns String;

}
