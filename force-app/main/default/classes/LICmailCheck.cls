public class LICmailCheck {
    public static void Mail(list<Life_Insurance_Corporation__c>LICList){
        
        set<String>NewNameSet = New set<String>();
        Set<String>NewEmailSet = New Set<String>();
        
        set<String>OldEmailSet = New Set<String>(); 
         Set<String>OldNameSet = New Set<String>();
        
        for(Life_Insurance_Corporation__c Lic : LICList){
        NewEmailSet.add(Lic.Email__c);
            NewNameSet.add(Lic.First_Name__c);
            
        }
        list<Life_Insurance_Corporation__c>LIC1 = [SELECT id,First_Name__c, Email__c FROM Life_Insurance_Corporation__c WHERE
                                                  First_Name__c IN : NewNameSet OR Email__c IN : NewEmailSet ];
        For(Life_Insurance_Corporation__c LIC2 : LIC1){
        OldNameSet.add(LIC2.First_Name__c);
        OldEmailSet.add(LIC2.Email__c);
        
        }
        for(Life_Insurance_Corporation__c Lic : LICList){
            if(OldEmailSet.Contains(Lic.Email__c)){
                lic.Email__c.AddError('Email Dup Found');
                
            }
            if(OldNameset.contains(Lic.First_Name__c)){
                lic.First_Name__c.AddError('Name Dup Found');
            }
        }
        }
}