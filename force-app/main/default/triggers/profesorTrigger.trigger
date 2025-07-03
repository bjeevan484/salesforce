trigger profesorTrigger on Professor__c (before Update) {
    ProfessorDemo.Subject(Trigger.new);
}