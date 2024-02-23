trigger ContactTrigger on Contact (before insert, before update) {
    
    if(Trigger.isInsert){
        ContactHandler.actDescripcion(Trigger.new);
    }
    if(Trigger.isUpdate){
        ContactHandler.beforeUpdateDescripcion(trigger.new, trigger.oldMap);
       
    }

}