public class ProductHandler {
    
    public static void verifyLettersProducts(List<Product2> products){
        for(Product2 p: products){
            if(!p.ProductCode.startsWith('XYZ-')){
                p.addError('El Producto debe iniciar con la siguiente nomenclatura "XYZ-NombreProducto" ');
            }
        }
    }

}