public class AccountProcessor {
    
    @future (callOut=true)
    public static void setContacts(Id accId){
        Account acc = new Account();
        List<Contact> cntactListPerAcc = new List<Contact>();
        acc = [SELECT Id, Name, (SELECT Id, LastName FROM Contacts) FROM Account WHERE Id=: accId];
        acc.Number_Of_Contacts__c = [SELECT Count() FROM Contact WHERE AccountId=:accId];
        update acc;

        
        

    }
}