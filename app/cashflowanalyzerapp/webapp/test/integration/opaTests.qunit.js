sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'cashflowanalyzerapp/test/integration/FirstJourney',
		'cashflowanalyzerapp/test/integration/pages/MatchedOpenItemsList',
		'cashflowanalyzerapp/test/integration/pages/MatchedOpenItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, MatchedOpenItemsList, MatchedOpenItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('cashflowanalyzerapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMatchedOpenItemsList: MatchedOpenItemsList,
					onTheMatchedOpenItemsObjectPage: MatchedOpenItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);