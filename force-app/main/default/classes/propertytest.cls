@istest
 class propertytest {
@istest
     static void DiscountTest(){
        Property__c VarTest = New Property__c();
         
        VarTest.Type_of_Property__c = 'Raw House';
        VarTest.Price__c = 1000;
        
        insert VarTest;
        
        Property__c VarTest2 = New Property__c();
        VarTest2 = [SELECT Price__c FROM Property__c WHERE id =: VarTest.Id];
        system.AssertEquals(950, VarTest2.Price__c);
    }
      static void DiscountTest1(){
        Property__c VarTest = New Property__c();
         
        VarTest.Type_of_Property__c = 'Villa';
        VarTest.Price__c = 1000;
        
        insert VarTest;
        
        Property__c VarTest2 = New Property__c();
        VarTest2 = [SELECT Price__c FROM Property__c WHERE id =: VarTest.Id];
        system.AssertEquals(850, VarTest2.Price__c);
      }
}