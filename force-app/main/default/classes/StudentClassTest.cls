@istest
 class StudentClassTest {
@istest
     static void StatusTest(){
         
          Student__c Student = New  Student__c();
         Student.Name = 'Shekar';
          Student.Age__c = 40;
         Student.Experience__c = 16;
         
         insert Student;
         
         Student__c Student1 = New Student__c();
         Student1 = [SELECT Status__c FROM Student__c WHERE id =: Student.id];
         
         System.assertEquals('Selected', Student1.Status__c );
     } 
     @IsTest
         static void StatusTest1(){
         
          Student__c Student1 = New  Student__c();
         Student1.Name = 'Shekar';
          Student1.Age__c = 20;
         Student1.Experience__c = 1;
         
         insert Student1;
         
         Student__c Student2 = New Student__c();
         Student2 = [SELECT Status__c FROM Student__c WHERE id =: Student1.id];
         
         system.assertEquals('Rejected', Student2.Status__c);
     } 
 }