public class ApexTransactionExample {
    public static void insertLeadAndAccount(String accName, String LeadName, String LeadCompany){
        Account a = new Account(Name = accName);
        insert a;
        Lead l1 = new Lead(LastName = LeadName, Company = LeadCompany);
        insert l1;
        Lead l2 = new Lead(LastName = LeadName, Company = 'MyTutorialRack');
        insert l2;
        
    }
}