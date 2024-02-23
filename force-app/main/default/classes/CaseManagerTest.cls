@isTest
private class CaseManagerTest {

    @isTest static void testGetCaseById() {
        // Preparar datos de prueba
        Case testCase = new Case(Subject='Test Case', Status='New');
        insert testCase;

        // Preparar el contexto de RestContext
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();

        req.requestURI = '/Cases/' + testCase.Id;  
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;

        // Invocar el método
        Test.startTest();
        Case result = CaseManager.getCaseById();
        Test.stopTest();

        // Verificar los resultados
        System.assertNotEquals(null, result, 'El caso no debería ser null');
        System.assertEquals(testCase.Id, result.Id, 'El ID del caso debería coincidir');
        System.assertEquals(testCase.Subject, result.Subject, 'El asunto del caso debería coincidir');
        System.assertEquals(testCase.Status, result.Status, 'El estado del caso debería coincidir');
    }

}