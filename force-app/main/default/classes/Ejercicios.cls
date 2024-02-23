public class Ejercicios {
    
    public Integer sumarNumeros(Integer num1, Integer num2, Integer num3){
        List<Integer> lstNum = new List<Integer>();
        Integer grandTotal = 0;
        lstNum.add(num1);
        lstNum.add(num2);
        lstNum.add(num3);
        for(Integer num: lstNum){
            grandTotal = grandTotal + num;
        }
        return grandTotal;

    }


}