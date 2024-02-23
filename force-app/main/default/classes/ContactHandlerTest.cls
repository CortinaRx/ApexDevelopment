@isTest
private class ContactHandlerTest {
	@testSetup
    private static void createTestData(){
        Contact c = new Contact();
        c.LastName = 'Ricciardo';
        insert c;
    }
    
    @isTest
    private static void createContactWithoutDescription(){
        List<Contact> contactLst = new List<Contact>();
        Contact c = new Contact();
        c = [SELECT Id, LastName, Description FROM Contact];
        contactLst.add(c);
        Test.startTest();
        ContactHandler.actDescripcion(contactLst);
        Test.stopTest();
        System.assertEquals('Hola nuevo contacto', contactLst.get(0).Description);
        
    }
    
    @isTest
    private static void createContactWithDescription(){
        List<Contact> contactLst = new List<Contact>();
        Contact c = new Contact();
        c = [SELECT Id, LastName, Description FROM Contact];
        c.Description = 'El samaritano del amor';
        contactLst.add(c);
        Test.startTest();
        ContactHandler.actDescripcion(contactLst);
        Test.stopTest();
        System.assertEquals('Hola nuevo contacto', contactLst.get(0).Description);
        
    }
    
    @isTest
    private static void updateDescriptionBefore(){
        List<Contact> cntactLst = new List<Contact>();
        Contact c1 = new Contact();
        c1 = [SELECT Id, LastName, Description FROM Contact];
        cntactLst.add(c1);
  		//Crear el Map y cambiar el Description a blanco;
        Map<Id, Contact> oppOldMap = new Map<Id, Contact>{c1.Id => c1.clone()};
        oppOldMap.get(c1.Id).Description = '';
        Test.startTest();
        ContactHandler.beforeUpdateDescripcion(cntactLst,oppOldMap);
        Test.stopTest();
        System.assertEquals('Chala Head Chala', cntactLst.get(0).Description);     
    }
    
    @isTest
    private static void updateDescriptionToChala(){
        List<Contact> cntactLst = new List<Contact>();
        Contact c1 = new Contact();
        c1 = [SELECT Id, LastName, Description FROM Contact];
        cntactLst.add(c1);
  		//Crear el Map y cambiar el Description a blanco;
        Map<Id, Contact> oppOldMap = new Map<Id, Contact>{c1.Id => c1.clone()};
        oppOldMap.get(c1.Id).Description = 'Chala Head Chala';
        Test.startTest();
        ContactHandler.beforeUpdateDescripcion(cntactLst,oppOldMap);
        Test.stopTest();
        System.assertEquals('No seas vago mijo cambia esta verga', cntactLst.get(0).Description);   
    }

    
}