trigger OpportunityTrigger on Opportunity (before update) {
    
    if(Trigger.isUpdate){
        OppHandler.itValueCorrectChange(Trigger.new, Trigger.OldMap);
    }

   
}