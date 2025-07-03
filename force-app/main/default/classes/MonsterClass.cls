Global class MonsterClass {
    webservice Static Void Monster(list<Monster_in__c> NewList){
        For(Monster_in__c VarValue : NewList){
            IF(VarValue.Name != 'XYZ'){
                VarValue.Company__c = 'Infosys';
                VarValue.Currency_used_in_Business__c = 'EUR';
                varvalue.salary__c = 2000;
                
}
        }
    }
    Public Static void IndeedRecord(List<Monster_in__c> NewList){
        List<indeed_com__c>UpdateIndeed = New List<indeed_com__c>();
        For(Monster_in__c  IndeedRecord : NewList ){
            indeed_com__c Recordupdate = New indeed_com__c();
            RecordUpdate.Name = IndeedRecord.Name;
            RecordUpdate.salary__c = IndeedRecord.salary__c;
            RecordUpdate.date__c = system.today();
            UpdateIndeed.add(Recordupdate);
           
        }
        If(!UpdateIndeed.IsEmpty()){
            insert UpdateIndeed;
        }        
    }
}