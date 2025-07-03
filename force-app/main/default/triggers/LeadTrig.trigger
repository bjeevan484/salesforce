trigger LeadTrig on Opportunity (after update) {
 OppLeadUpdate.LeadUpdate(trigger.new);
}