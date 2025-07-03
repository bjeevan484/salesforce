@isTest
public class customNotificationTest {
@isTest
    public static void TestingNotification(){
       Account Acc = New Account();
	Acc.name = 'test 12';
	insert Acc;
	Opportunity opp = new Opportunity();	
	Opp.name = 'test';
	opp.AccountId = Acc.id;
	opp.stagename = 'closed won';
	opp.closeDate = system.today();
        opp.Type = 'New Customer';
	insert opp;   
         Test.startTest();
            // Call the method with the list of opportunities
            CustomNotification.sendCS([SELECT Id, Name, StageName, AccountId FROM Opportunity WHERE AccountId = :acc.Id]);
        Test.stopTest();
    }
}