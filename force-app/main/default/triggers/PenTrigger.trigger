trigger PenTrigger on Peter_Parkers_Pen__c (before insert, before update) {
ParkersClass.Pen(Trigger.new);
    if(Trigger.IsInsert && Trigger.IsBefore || Trigger.IsUpdate && Trigger.IsBefore){
        penDuplicateclass.pen(Trigger.new);
    }
}