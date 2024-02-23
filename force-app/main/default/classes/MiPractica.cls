public with sharing class MiPractica {
    
    public Map<String,Integer> pruebaMapa(){
       
        Map<String,Integer> mapaEdades = new Map<String,Integer>();
        List<Integer> pruebaNumeros = new List<Integer>();
        mapaEdades.put('Ricardo', 10);
        mapaEdades.put('Valentina', 15);
        mapaEdades.put('Sabrina', 20);
        System.debug('Esto es lo que hay en el Mapa ' + mapaEdades);

        if(mapaEdades.containsKey('Ricardo')){
            System.debug(mapaEdades.get('Ricardo'));
        }

        pruebaNumeros = mapaEdades.values();
        System.debug(pruebaNumeros + ' Contiene esto la lista.');

        return mapaEdades;
    }

    private void comprobarCiudad(Map<String,String> mapCiudades, String nombreCiudad){
        if(mapCiudades.containsKey(nombreCiudad)){
            System.debug('Si existe la ciudad y la poblacion es: '+ mapCiudades.get(nombreCiudad));
        }else{
            System.debug('No existe la ciudad');
        }
    }

    public Map<String,String> miMap(){
        Map<String,String> mapCiudades = new Map<String,String>();
        List<String> mapaCiudadanos = new List<String>();
        List<String> mapaCiudad = new List<String>();

        mapCiudades.put('Caracas', 'Caraqueño');
        mapCiudades.put('Barquisimeto', 'Guaro');
        mapCiudades.put('Merida', 'Gocho');

        for(String ciudad: mapCiudades.values()){
            System.debug(ciudad);
        }
        
        return mapCiudades;

    }

    public void createAcc(String nombre, String phone){
        Account nuevaCuenta = new Account();
        nuevaCuenta.Name = nombre;
        nuevaCuenta.Phone = phone;
        insert nuevaCuenta;
    }


}