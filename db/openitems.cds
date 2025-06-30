namespace app.openitems;

using {
    managed,
    Currency
} from '@sap/cds/common';


type openItems {
    documentDate          : Date;
    postingDate           : Date;
    documentType          : String(2);
    profitCenter          : String(10);
    reference             : String;
    referenceKey2         : String;
    assignment            : String;
    documentHeaderText    : String;
    text                  : String;
    postingKey            : String(2);

    @Semantics.currencyCode
    documentCurrency      : Currency;

    @Semantics.amount.currencyCode: 'documentCurrency'
    amountInDocCurr       : Decimal(15, 2);

    @Semantics.currencyCode
    localCurrency         : Currency;

    @Semantics.amount.currencyCode: 'localCurrency'
    amountInLocalCurrency : Decimal(15, 2);
}

aspect additionalFields {
    companyCode      : String;
    yearMonth        : String;
    documentNumber   : String;
    account          : String;
    entryDate        : Date;
    username         : String(100);
    postingPeriod    : Integer;

    @Semantics.amount.currencyCode: 'documentCurrency'
    absoluteValue    : Decimal(15, 2);
    usdAmount        : Decimal(15, 2);
    days             : Integer;
    agingBracket     : String(100);
    processingStatus : String(20);
}

entity OpenItemsStagingTable : openItems, additionalFields, managed {
    key runID : Integer;
    key seqNo : Integer;
}

entity MatchedOpenItems : openItems, additionalFields, managed {

    key runID            : Integer;
    key seqNo            : Integer;
        matchFound       : Boolean;
        matchID          : Integer;
        matchSeq         : Integer;
        matchConfidence  : Decimal(5, 2);
        matchRemarks     : String;
        matchStatus      : String(20);
        matchDate        : Date;
        nature           : String;
        teamOrArea       : String;
        personInCharge   : String;
        rejectionComment : String;
        rejectedBy       : String;
        clearingStatus   : String(20);
        clearingRef      : Integer;
        clearingSeq      : Integer;
        clearingComments : String;
        clearingDate     : Date;
        postingYearMonth : String(7);
        postingDocument  : Integer;

}

entity ClearingData : openItems, managed {
    key clearingRef        : Integer;
    key clearingSeq        : Integer;
        companyCode        : String(4);
        account            : Integer;
        refYearMonth       : String(7);
        refDocument        : Integer;
        refAccount         : Integer;
        postingToSAPStatus : String(10);
        postingYearMonth   : String(7);
        postingDocument    : Integer;

}
