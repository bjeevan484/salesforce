trigger opportunityTrigger on Opportunity (before insert, before update) {
    if (Trigger.isBefore && Trigger.isInsert) {
        opportunityAmountupdatee.opportunityAmountupdatee(Trigger.new);
        opportunityAmountupdatee.statusUpdate(trigger.new, trigger.OldMap)
    }
}