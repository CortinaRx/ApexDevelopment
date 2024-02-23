public class ContactHandler {
    
    public static void actDescripcion(List<Contact> cntactLst){
        for(Contact c: cntactLst){
            c.Description = 'Hola nuevo contacto';
        }
    }
    
    //Method que actualiza las descripciones.
    public static void beforeUpdateDescripcion(List<Contact> cntactUpdating, Map<Id,Contact> oldCntact){
        
        for(Contact c: cntactUpdating){
            Contact oldCntacto = new Contact();
            oldCntacto = oldCntact.get(c.Id);
            
            if(String.isBlank(oldCntacto.Description)){
            c.Description = 'Chala Head Chala'; 
        	}
            if(oldCntacto.Description == 'Chala Head Chala'){
                    c.Description = 'No seas vago mijo cambia esta verga';
                }
        }  
    }
   
}