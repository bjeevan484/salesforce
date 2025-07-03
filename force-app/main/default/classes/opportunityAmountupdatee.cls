public with sharing class opportunityAmountupdatee {
    public static void opportunityAmountupdatee(List<Opportunity> oppList) {
        for(Opportunity opp: oppList){
            if(opp.Amount != null && opp.amount <= 100000) {
                opp.stagename = 'needs analysis';
            }
        }
    }
    public static void statusUpdate(list<Opportunity>oppList, Map<Id, Opportunity>OldMap){
        for(Opportunity Opp : Opplist){
            if((oldMap==null)||(opp.StageName!=oldMap.get(opp.Id).StageName)){
                if(opp.StageName=='Closed Won'){ opp.Description='Opportunity is Closed won';
                }
                else if(opp.StageName=='Closed Lost'){ opp.Description='Opportunity is closed lost';
                }
                else{ opp.Description='Opportunity is open';
                }
            }
        }
    }
}