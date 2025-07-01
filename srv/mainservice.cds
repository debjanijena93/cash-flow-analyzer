using app.openitems from '../db/openitems';


service mainService {

    entity OpenItemsStagingTable as projection on openitems.OpenItemsStagingTable;
    entity MatchedOpenItems      as projection on openitems.MatchedOpenItems;

    action updateProcessingStatus(items : array of {
        runID            : Integer;
        processingStatus : String;
    })                                                                returns {};

    action uploadCSV(file : LargeBinary @Core.MediaType: 'text/csv' ) returns String;
    action importCSV()                                                returns String;

    entity FileUpload {
        key fileName    : String;
            user        : String;
            fileContent : LargeBinary @Core.MediaType: imageType;
            imageType   : String      @Core.IsMediaType;


    }

}
