trigger opportunityTrigger on Opportunity (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        opportunityAmountupdatee.opportunityAmountupdatee(Trigger.new);
    }
}