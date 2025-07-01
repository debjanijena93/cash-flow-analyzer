using mainService as service from '../../srv/mainservice';
annotate service.MatchedOpenItems with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'documentDate',
                Value : documentDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'postingDate',
                Value : postingDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'documentType',
                Value : documentType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'profitCenter',
                Value : profitCenter,
            },
            {
                $Type : 'UI.DataField',
                Label : 'reference',
                Value : reference,
            },
            {
                $Type : 'UI.DataField',
                Label : 'referenceKey2',
                Value : referenceKey2,
            },
            {
                $Type : 'UI.DataField',
                Label : 'assignment',
                Value : assignment,
            },
            {
                $Type : 'UI.DataField',
                Label : 'documentHeaderText',
                Value : documentHeaderText,
            },
            {
                $Type : 'UI.DataField',
                Label : 'text',
                Value : text,
            },
            {
                $Type : 'UI.DataField',
                Label : 'postingKey',
                Value : postingKey,
            },
            {
                $Type : 'UI.DataField',
                Label : 'documentCurrency_code',
                Value : documentCurrency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'amountInDocCurr',
                Value : amountInDocCurr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'localCurrency_code',
                Value : localCurrency_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'amountInLocalCurrency',
                Value : amountInLocalCurrency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'companyCode',
                Value : companyCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'yearMonth',
                Value : yearMonth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'documentNumber',
                Value : documentNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'account',
                Value : account,
            },
            {
                $Type : 'UI.DataField',
                Label : 'entryDate',
                Value : entryDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'username',
                Value : username,
            },
            {
                $Type : 'UI.DataField',
                Label : 'postingPeriod',
                Value : postingPeriod,
            },
            {
                $Type : 'UI.DataField',
                Label : 'absoluteValue',
                Value : absoluteValue,
            },
            {
                $Type : 'UI.DataField',
                Label : 'usdAmount',
                Value : usdAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'days',
                Value : days,
            },
            {
                $Type : 'UI.DataField',
                Label : 'agingBracket',
                Value : agingBracket,
            },
            {
                $Type : 'UI.DataField',
                Label : 'processingStatus',
                Value : processingStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'runID',
                Value : runID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'seqNo',
                Value : seqNo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'matchFound',
                Value : matchFound,
            },
            {
                $Type : 'UI.DataField',
                Label : 'matchID',
                Value : matchID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'matchSeq',
                Value : matchSeq,
            },
            {
                $Type : 'UI.DataField',
                Label : 'matchConfidence',
                Value : matchConfidence,
            },
            {
                $Type : 'UI.DataField',
                Label : 'matchRemarks',
                Value : matchRemarks,
            },
            {
                $Type : 'UI.DataField',
                Label : 'matchStatus',
                Value : matchStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'matchDate',
                Value : matchDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'nature',
                Value : nature,
            },
            {
                $Type : 'UI.DataField',
                Label : 'teamOrArea',
                Value : teamOrArea,
            },
            {
                $Type : 'UI.DataField',
                Label : 'personInCharge',
                Value : personInCharge,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rejectionComment',
                Value : rejectionComment,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rejectedBy',
                Value : rejectedBy,
            },
            {
                $Type : 'UI.DataField',
                Label : 'clearingStatus',
                Value : clearingStatus,
            },
            {
                $Type : 'UI.DataField',
                Label : 'clearingRef',
                Value : clearingRef,
            },
            {
                $Type : 'UI.DataField',
                Label : 'clearingSeq',
                Value : clearingSeq,
            },
            {
                $Type : 'UI.DataField',
                Label : 'clearingComments',
                Value : clearingComments,
            },
            {
                $Type : 'UI.DataField',
                Label : 'clearingDate',
                Value : clearingDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'postingYearMonth',
                Value : postingYearMonth,
            },
            {
                $Type : 'UI.DataField',
                Label : 'postingDocument',
                Value : postingDocument,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'seqNo',
            Value : seqNo,
        },
        {
            $Type : 'UI.DataField',
            Label : 'runID',
            Value : runID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'documentDate',
            Value : documentDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'postingDate',
            Value : postingDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'documentType',
            Value : documentType,
        },
    ],
);

