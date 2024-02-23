@isTest
private class OppHandlerTest {
    
   	@testSetup
    private static void createOpp(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Richie Opp';
        opp.StageName = 'Closed Won';
        Date todayDate = Date.today();
        opp.CloseDate = todayDate;
        insert opp;
    }
    @isTest
    private static void createOppWithStageCloseWon(){
        Opportunity opp = new Opportunity();
        opp = [SELECT Id, Name,StageName,CloseDate FROM Opportunity];
        List<Opportunity> oppLst = new List<Opportunity>();
        oppLst.add(opp);
        Map<Id,Opportunity> oppOldMap = new Map<Id,Opportunity>{opp.Id => opp.clone()};
            oppOldMap.get(opp.Id).StageName = 'Prospecting';
        Test.StartTest();
        OppHandler.itValueCorrectChange(oppLst, oppOldMap);
        Test.StopTest();
        System.assertEquals('Closed Won', oppLst.get(0).StageName);
        
    }
     @isTest
    private static void createOppWithStageOthers(){
        Opportunity opp = new Opportunity();
        opp = [SELECT Id, Name,StageName,CloseDate FROM Opportunity];
        opp.StageName = 'Prospecting';
        List<Opportunity> oppLst = new List<Opportunity>();
        oppLst.add(opp);
        Map<Id,Opportunity> oppOldMap = new Map<Id,Opportunity>{opp.Id => opp.clone()};
            oppOldMap.get(opp.Id).StageName = 'Qualification';
        Test.StartTest();
        OppHandler.itValueCorrectChange(oppLst, oppOldMap);
        Test.StopTest();
        System.assertEquals('Prospecting', oppLst.get(0).StageName);
        
    }

}