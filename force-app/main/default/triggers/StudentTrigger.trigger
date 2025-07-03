trigger StudentTrigger on Student__c (before insert, before update) {
	StudentClass.Status(trigger.new);
}