public with sharing class opportunityAmountupdatee {
    public static void opportunityAmountupdatee(List<Opportunity> oppList) {
        for(Opportunity opp: oppList){
            if(opp.Amount != null && opp.amount <= 100000) {
                opp.stagename = 'needs analysis'; // Set a default description
            }
        }
    }
}