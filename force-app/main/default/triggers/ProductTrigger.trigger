trigger ProductTrigger on Product2 (before insert) {
    if(Trigger.isInsert){
        ProductHandler.verifyLettersProducts(Trigger.new);
    }
}