trigger LeadDupCheck on Lead (before insert, before update) {
/*LeadDuplicate.LeadUp(Trigger.new);*/
    
    if(Trigger.IsBefore){
    DummyLead.DLead(Trigger.new);
}
}