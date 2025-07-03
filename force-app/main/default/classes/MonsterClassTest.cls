@istest
public class MonsterClassTest {
@istest
    Public Static void MonsterTest(){
        Monster_in__c VarP = New Monster_in__c();
        VarP.Name = 'yz';
        VarP.Age__c = 10;
        insert VarP;
        
        Monster_in__c Varp2 = New Monster_in__c();
        Varp2 = [SELECT Company__c , Currency_used_in_Business__c, salary__c FROM Monster_in__c WHERE id =: VarP.Id];
        
        System.AssertEquals('Infosys',  Varp2.Company__c);
  		system.assertEquals('EUR', Varp2.Currency_used_in_Business__c);      
        
    }
}