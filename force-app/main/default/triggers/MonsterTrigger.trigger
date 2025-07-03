trigger MonsterTrigger on Monster_in__c ( before insert, After Insert) {
    
	 If(Trigger.IsInsert){
    IF(Trigger.IsBefore){
       
            MonsterClass.Monster(Trigger.new);
            
        }
    }
    If(Trigger.IsAfter){
        MonsterClass.IndeedRecord(Trigger.New);
    }
}