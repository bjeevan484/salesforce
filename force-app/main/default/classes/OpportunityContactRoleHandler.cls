public class OpportunityContactRoleHandler {
    public static void updateContactRolesOnStageChange(List<Opportunity> newOpps) {
        Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>();

        for (Opportunity opp : newOpps) {
            oppMap.put(opp.Id, opp);
        }

        List<OpportunityContactRole> contactRoles = [
            SELECT Id, OpportunityId, Role 
            FROM OpportunityContactRole 
            WHERE OpportunityId IN :oppMap.keySet()
        ];

        List<OpportunityContactRole> rolesToUpdate = new List<OpportunityContactRole>();

        for (OpportunityContactRole role : contactRoles) {
            Opportunity opp = oppMap.get(role.OpportunityId);
            
            if (opp.StageName == 'Closed Won') {
                role.Role = 'Decision Maker';
            } else if (opp.StageName == 'Qualification') {
                role.Role = 'Influencer';
            } else {
                role.Role = 'Other';
            }

            rolesToUpdate.add(role);
        }

        if (!rolesToUpdate.isEmpty()) {
            update rolesToUpdate;
        }
    }
}