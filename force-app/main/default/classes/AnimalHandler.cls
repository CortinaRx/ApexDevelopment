global class AnimalHandler {

    public class Animal {
        public Integer count;
        public List<Entry> entries;
    }

    public class Entry {
        public String API;
        public String Description;
        // Otros campos según sea necesario
    }

    @future(callout=true) // Marcado como futuro para permitir callouts
    public static void fetchAndSaveAnimalDetails() {
        HttpRequest httpReq = new HttpRequest();
        Http http = new Http();
        httpReq.setMethod('GET');
        httpReq.setEndPoint('https://api.publicapis.org/entries');
        HttpResponse httpRes = http.send(httpReq);

        if(httpRes.getStatusCode() == 200) {
            // Deserializar la respuesta JSON a la clase Animal
            Animal a = (Animal) JSON.deserialize(httpRes.getBody(), Animal.class);
            
            // Lista para almacenar los nuevos registros de Animal__c para inserción masiva
            List<Animal__c> animalsToInsert = new List<Animal__c>();

            // Iterar sobre las entradas y crear nuevos registros de Animal__c
            for(Entry entry : a.entries) {
                Animal__c animalRecord = new Animal__c();
                animalRecord.API__c = entry.API;
                animalRecord.Description__c = entry.Description;
                animalsToInsert.add(animalRecord);
            }

            // Insertar los nuevos registros en Salesforce
            if(!animalsToInsert.isEmpty()) {
                insert animalsToInsert;
            }
        } else {
            System.debug('Error en callout HTTP: ' + httpRes.getStatusCode());
        }
    }
}