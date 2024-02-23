@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager {
    @HttpGet
    global static Case getCaseById(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Case c1 = [SELECT Id, CaseNumber, Subject,Status FROM Case WHERE Id =:caseId];
        Return c1;
    }
    
    

}