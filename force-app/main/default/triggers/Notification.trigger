trigger Notification on Opportunity (after update) {
OpportunityContactRoleHandler.updateContactRolesOnStageChange(trigger.new);
}