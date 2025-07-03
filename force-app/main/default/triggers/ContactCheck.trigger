trigger ContactCheck on Contact (after insert, after update) {
if(trigger.Isafter){
    if(trigger.isInsert || Trigger.Isupdate){
        
         AccountUpdate.updateAccountOwner(trigger.new)   ;
        }
    }
}