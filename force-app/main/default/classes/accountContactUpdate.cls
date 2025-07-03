public with sharing class accountContactUpdate {
    public static void accountContactUpdate(List<Account>Acclist) {
List<Contact>conList = new List<Contact>();
for(Account acc: Acclist) {
    Contact con = new contact();
    con.FirstName = acc.Name+'FN';
    con.LastName = acc.Name+'LN';
    con.AccountId = acc.id;
    conList.add(con);
}
 if (!conList.isEmpty()) {
        insert conList;
    }
    
}
Public static void CreateOppotunity(List<Account>AccLis){
    List<Opportunity>OppList = new List<Opportunity>();
    for(Account acc1 : Acclis){
        Opportunity Opp = new Opportunity();
        opp.name = acc1.Name +' '+ 'opp';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today().addDays(30);
        OppList.add(Opp);
    }
        if (!OppList.isEmpty()) {
            insert OppList;
                  }
   
}
    public static void createCase(list<case>caseList){
         List<Account> accList = new List<Account>();
        for (Case cs : caseList) {
            if (cs.AccountId != null) {
                Account acc = new Account();
                acc.Id = cs.AccountId;
                acc.Description  = cs.CaseNumber;
                 accList.add(acc);
            }
        }
        if (!accList.isEmpty()) {
            update accList;
        }

}
    public static void create(list<Account>AccList1){
        list<contact>con1 = new list<contact>();
        list<opportunity> opp1 = new list<opportunity>();
        for(Account Acc1 : AccList1){
           
            if(acc1.Contact__c == true){
                 contact con2 = new contact();
                con2.AccountId = acc1.id;
                con2.FirstName = acc1.Name + 'fn';
                con2.LastName  = acc1.Name + 'Ln';
                con1.add(con2);
                
            }
             if(acc1.Opportunity__c == true){
                opportunity opp2 = new opportunity();
                opp2.AccountId = acc1.id;
                opp2.Name = acc1.Name;
                opp2.StageName  = 'prospecting';
                opp2.CloseDate = system.today();
                opp1.add(opp2);
            }
            if(!con1.isEmpty()){
                insert con1;
            }
            if(!opp1.isEmpty()){
            insert opp1;    
            }
            
        }
    }
    public static void oldMapScenatio(list<Account>AccList2, Map<id,Account>oldMap){
        for(Account Acclist3:acclist2){
            if(Acclist3.Phone != oldMap.get(acclist3.id).Phone){
                acclist3.Description = 'Phone number udpated old value : '+oldMap.get(acclist3.id).phone +'& New Value :' +acclist3.Phone;
                
            }
        }
    }
}