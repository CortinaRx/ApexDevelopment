public with sharing class OppHandler {

    public static void itValueCorrectChange(List<Opportunity> oppNew, Map<Id,Opportunity> oppOld){
        for(Opportunity o: oppNew){
            Opportunity oldOpportunity = oppOld.get(o.Id);
            if(o.StageName == 'Closed Won' || ((oldOpportunity.StageName != 'Closed Won') && (o.StageName == 'Closed Won'))){
                o.Its_Value_Correct__c = true;
            }else{
                 o.Its_Value_Correct__c = false;
            }
        }
    }



}