global class UpdateContactAddInfo implements Database.Batchable<SObject> {
    	
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Id, Name 
                                         FROM Account]);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Contact> contacts = new List<Contact>();
       
        
    }
    global void finish(Database.BatchableContext bc){
        
    }

}