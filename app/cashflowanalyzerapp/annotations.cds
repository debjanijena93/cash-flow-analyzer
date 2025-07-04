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
            Value : matchID,
            Label : 'Match ID',
        },
        {
            $Type : 'UI.DataField',
            Value : matchSeq,
            Label : 'Match Sequence',
        },
        {
            $Type : 'UI.DataField',
            Value : matchRemarks,
            Label : 'Match Remarks',
        },
        {
            $Type : 'UI.DataField',
            Value : matchConfidence,
            Label : 'Match Confidence',
        },
        {
            $Type : 'UI.DataField',
            Value : matchDate,
            Label : 'Match Date',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Document Date',
            Value : documentDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Posting Date',
            Value : postingDate,
        },
        {
            $Type : 'UI.DataField',
            Value : entryDate,
            Label : 'Entry Date',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Document Type',
            Value : documentType,
        },
        {
            $Type : 'UI.DataField',
            Value : documentNumber,
            Label : 'Document Number',
        },
        {
            $Type : 'UI.DataField',
            Value : postingKey,
            Label : 'Posting Key',
        },
        {
            $Type : 'UI.DataField',
            Value : companyCode,
            Label : 'Company Code',
        },
        {
            $Type : 'UI.DataField',
            Value : account,
            Label : 'Account',
        },
        {
            $Type : 'UI.DataField',
            Value : amountInDocCurr,
            Label : 'Amount in Document Currency',
        },
        {
            $Type : 'UI.DataField',
            Value : amountInLocalCurrency,
            Label : 'Amount in Local Currency',
        },
        {
            $Type : 'UI.DataField',
            Value : absoluteValue,
            Label : 'Absolute Value',
        },
        {
            $Type : 'UI.DataField',
            Value : usdAmount,
            Label : 'USD Amount',
        },
        {
            $Type : 'UI.DataField',
            Value : assignment,
            Label : 'Assignment',
        },
        {
            $Type : 'UI.DataField',
            Value : days,
            Label : 'Days',
        },
        {
            $Type : 'UI.DataField',
            Value : agingBracket,
            Label : 'Aging Bracket',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingComments,
            Label : 'Clearing Comments',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingDate,
            Label : 'Clearing Date',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingRef,
            Label : 'Clearing Ref',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingSeq,
            Label : 'Clearing Seq',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingStatus,
            Label : 'Clearing Status',
        },
        {
            $Type : 'UI.DataField',
            Value : documentHeaderText,
            Label : 'Document Header Text',
        },
        {
            $Type : 'UI.DataField',
            Value : text,
            Label : 'Text',
        },
        {
            $Type : 'UI.DataField',
            Value : nature,
            Label : 'Nature',
        },
        {
            $Type : 'UI.DataField',
            Value : teamOrArea,
            Label : 'Team or Area',
        },
        {
            $Type : 'UI.DataField',
            Value : username,
            Label : 'Username',
        },
        {
            $Type : 'UI.DataField',
            Value : personInCharge,
            Label : 'Person in Charge',
        },
        {
            $Type : 'UI.DataField',
            Value : profitCenter,
            Label : 'Profit Center',
        },
        {
            $Type : 'UI.DataField',
            Value : reference,
            Label : 'Reference',
        },
        {
            $Type : 'UI.DataField',
            Value : referenceKey2,
            Label : 'Reference Key 2',
        },
        {
            $Type : 'UI.DataField',
            Value : yearMonth,
            Label : 'Year/Month',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
        },
        {
            $Type : 'UI.DataField',
            Value : postingDocument,
            Label : 'Posting Document',
        },
        {
            $Type : 'UI.DataField',
            Value : postingPeriod,
            Label : 'Posting Period',
        },
        {
            $Type : 'UI.DataField',
            Value : postingYearMonth,
            Label : 'Posting Year/Month',
        },
        {
            $Type : 'UI.DataField',
            Value : processingStatus,
            Label : 'Processing Status',
        },
        {
            $Type : 'UI.DataField',
            Value : rejectedBy,
            Label : 'Rejected By',
        },
        {
            $Type : 'UI.DataField',
            Value : rejectionComment,
            Label : 'Rejection Comment',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'mainService.rejectMatchedEntry',
            Label : 'Reject Match',
            InvocationGrouping : #Isolated
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : matchFound,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : true,
                        },
                    ],
                },
            ],
        },
        Text : 'Matched Entries',
    },
    UI.LineItem #tableView : [
        {
            $Type : 'UI.DataField',
            Value : matchID,
            Label : 'Match ID',
        },
        {
            $Type : 'UI.DataField',
            Value : matchSeq,
            Label : 'Match Sequence',
        },
        {
            $Type : 'UI.DataField',
            Value : matchRemarks,
            Label : 'Match Remarks',
        },
        {
            $Type : 'UI.DataField',
            Value : matchConfidence,
            Label : 'Match Confidence',
        },
        {
            $Type : 'UI.DataField',
            Value : matchDate,
            Label : 'Match Date',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Document Date',
            Value : documentDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Posting Date',
            Value : postingDate,
        },
        {
            $Type : 'UI.DataField',
            Value : entryDate,
            Label : 'Entry Date',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Document Type',
            Value : documentType,
        },
        {
            $Type : 'UI.DataField',
            Value : documentNumber,
            Label : 'Document Number',
        },
        {
            $Type : 'UI.DataField',
            Value : postingKey,
            Label : 'Posting Key',
        },
        {
            $Type : 'UI.DataField',
            Value : companyCode,
            Label : 'Company Code',
        },
        {
            $Type : 'UI.DataField',
            Value : account,
            Label : 'Account',
        },
        {
            $Type : 'UI.DataField',
            Value : amountInDocCurr,
            Label : 'Amount in Document Currency',
        },
        {
            $Type : 'UI.DataField',
            Value : amountInLocalCurrency,
            Label : 'Amount in Local Currency',
        },
        {
            $Type : 'UI.DataField',
            Value : absoluteValue,
            Label : 'Absolute Value',
        },
        {
            $Type : 'UI.DataField',
            Value : usdAmount,
            Label : 'USD Amount',
        },
        {
            $Type : 'UI.DataField',
            Value : assignment,
            Label : 'Assignment',
        },
        {
            $Type : 'UI.DataField',
            Value : days,
            Label : 'Days',
        },
        {
            $Type : 'UI.DataField',
            Value : agingBracket,
            Label : 'Aging Bracket',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingComments,
            Label : 'Clearing Comments',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingDate,
            Label : 'Clearing Date',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingRef,
            Label : 'Clearing Ref',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingSeq,
            Label : 'Clearing Seq',
        },
        {
            $Type : 'UI.DataField',
            Value : clearingStatus,
            Label : 'Clearing Status',
        },
        {
            $Type : 'UI.DataField',
            Value : documentHeaderText,
            Label : 'Document Header Text',
        },
        {
            $Type : 'UI.DataField',
            Value : text,
            Label : 'Text',
        },
        {
            $Type : 'UI.DataField',
            Value : nature,
            Label : 'Nature',
        },
        {
            $Type : 'UI.DataField',
            Value : teamOrArea,
            Label : 'Team or Area',
        },
        {
            $Type : 'UI.DataField',
            Value : username,
            Label : 'Username',
        },
        {
            $Type : 'UI.DataField',
            Value : personInCharge,
            Label : 'Person in Charge',
        },
        {
            $Type : 'UI.DataField',
            Value : profitCenter,
            Label : 'Profit Center',
        },
        {
            $Type : 'UI.DataField',
            Value : reference,
            Label : 'Reference',
        },
        {
            $Type : 'UI.DataField',
            Value : referenceKey2,
            Label : 'Reference Key 2',
        },
        {
            $Type : 'UI.DataField',
            Value : yearMonth,
            Label : 'Year/Month',
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
        },
        {
            $Type : 'UI.DataField',
            Value : postingDocument,
            Label : 'Posting Document',
        },
        {
            $Type : 'UI.DataField',
            Value : postingPeriod,
            Label : 'Posting Period',
        },
        {
            $Type : 'UI.DataField',
            Value : postingYearMonth,
            Label : 'Posting Year/Month',
        },
        {
            $Type : 'UI.DataField',
            Value : processingStatus,
            Label : 'Processing Status',
        },
        {
            $Type : 'UI.DataField',
            Value : rejectedBy,
            Label : 'Rejected By',
        },
        {
            $Type : 'UI.DataField',
            Value : rejectionComment,
            Label : 'Rejection Comment',
        }
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : matchFound,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : false,
                        },
                    ],
                },
            ],
        },
        Text : 'Non-matched Entries',
    },
    UI.SelectionFields : [
        account,
        documentDate,
    ],
);

annotate service.MatchedOpenItems with {
    account @Common.Label : 'GL Selection'
};

annotate service.MatchedOpenItems with {
    documentDate @Common.Label : 'Document Date'
};

annotate service.MatchedOpenItems with {
    amountInDocCurr @Measures.ISOCurrency : documentCurrency_code
};

annotate service.MatchedOpenItems with {
    amountInLocalCurrency @Measures.ISOCurrency : localCurrency_code
};

