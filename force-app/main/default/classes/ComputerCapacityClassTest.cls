@Istest
Class ComputerCapacityClassTest{
    @IsTest
    Static void  CapacityTest(){
        Computer_Capacity__c Status = New Computer_Capacity__c();
        Status.Hard_Disc_In_GB__c = 500;
        Status.Ram_Capacity__c = 8;
        Status.Processor_In_GHz__c = 3;
        insert Status;
        
        Computer_Capacity__c Status1 = New Computer_Capacity__c();
        Status1 = [Select Capacity_status__c FROM Computer_Capacity__c WHERE Id =: status.Id];
        system.assertEquals('Expected Capacity', Status1.Capacity_status__c);
        System.debug('Capacity Test is successfull');
    }
    @IsTest
    Static void  CapacityTest1(){
        Computer_Capacity__c Status = New Computer_Capacity__c();
        Status.Hard_Disc_In_GB__c = 500;
        Status.Ram_Capacity__c = 1;
        Status.Processor_In_GHz__c = 1;
        insert Status;
        
        Computer_Capacity__c Status1 = New Computer_Capacity__c();
        Status1 = [Select Capacity_status__c FROM Computer_Capacity__c WHERE Id =: status.Id];
        system.assertEquals('Low Capacity', Status1.Capacity_status__c);
    System.debug('Capacity Test1 is successful');
}
}