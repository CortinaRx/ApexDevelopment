public with sharing class Prueba {
    
    public void pushCuenta(String name){
        try{
            Account cuenta = new Account();
            cuenta.Name = name;
            cuenta.Phone = '123345';
            insert cuenta;
            system.debug('La cuenta se introdujo: ' +  cuenta.Name);
        }catch(DmlException e){
            System.debug('Ocurrio un error de DML: '+ e.getMessage());
        }

    }

    public List<Account> getAcc(){
        List<Account> acc = new List<Account>();
        try{
            acc = [SELECT Id, Name FROM Account];
            System.debug('La query ha ido con exito y este es el tamaño: ' + acc.size());
            
        }catch(LimitException e){
            System.debug('Se ha generado una exccepcion por limites de gobernanzas ' + e.getMessage());
        }
        return acc;
    }

}