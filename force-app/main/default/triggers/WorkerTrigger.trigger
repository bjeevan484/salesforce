trigger WorkerTrigger on Workers__c (before insert) {
    If(Trigger.Isinsert){
        If(Trigger.IsBefore){
            WorkerClass.Worker(Trigger.New);
        }
    }
}