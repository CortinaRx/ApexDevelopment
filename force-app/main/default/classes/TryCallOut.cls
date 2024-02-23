public class TryCallOut {
    
    public static void makeCallOut(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://pokeapi.co/api/v2/pokemon');
        request.setMethod('GET');
        
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200){
                String responseBody = response.getBody();
                System.debug('Response Body' + responseBody);
            }else{
                System.debug('Error en el Call out: '+ response.getStatus());
            }
        }catch(System.CalloutException e){
            System.debug('Callout Error '+ e);
        }
        
    }

}