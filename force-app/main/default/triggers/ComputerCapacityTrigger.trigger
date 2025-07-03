trigger ComputerCapacityTrigger on Computer_Capacity__c (before insert, before update) {
        ComputerCapacityClass.Capacity(Trigger.new);
}