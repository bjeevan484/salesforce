@IsTest
private class accountContactUpdateTest {
    @IsTest
    static void testAccountContactUpdate2() {
      // Step 1: Create test account data
        Account acc1 = new Account(Name = 'TestAccount1', contact__c = true,  opportunity__c =true);
        insert new List<Account>{acc1};

        // Step 2: Call the method under test
        List<Account> accountList = [SELECT Id, Name FROM Account WHERE Id IN :new List<Id>{acc1.Id}];

        Test.startTest();
        accountContactUpdate.accountContactUpdate(accountList); // Replace with your actual class name
        Test.stopTest();

        // Step 3: Validate that contacts were created
        List<Contact> contacts = [SELECT Id, FirstName, LastName, AccountId FROM Contact WHERE AccountId IN :new List<Id>{acc1.Id}];

       // System.assertEquals(3, contacts.size(), 'Two contacts should be created');

        for (Contact con : contacts) {
            if (con.AccountId == acc1.Id) {
                System.assertEquals('TestAccount1FN', con.FirstName);
                System.assertEquals('TestAccount1LN', con.LastName);
            } else {
                System.assert(false, 'Unexpected AccountId on Contact');
            }
        }
    }
    @IsTest
    static void testCreateOppotunity() {
        // Create test data: Insert 200 Account records
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;

        // Call the method being tested
        Test.startTest();
        accountContactUpdate.CreateOppotunity(testAccounts);
        Test.stopTest();

        // Perform assertions to verify the expected behavior
        // For example, you can query the created Opportunity records and check their count or other properties
        List<Opportunity> createdOpportunities = [SELECT Id, Name, StageName, CloseDate, AccountId FROM Opportunity WHERE AccountId IN :testAccounts];
        //System.assertEquals(200, createdOpportunities.size(), 'Number of created opportunities should match the number of test accounts');
    }

    @isTest
    static void testCreateCase() {
        // Step 1: Create an Account
        Account acc = new Account(Name = 'Test Account', Phone= '123');
        insert acc;

        // Step 2: Create a Case related to that Account
        Case cs = new Case(
            Subject = 'Test Case',
            Status = 'New',
            Origin = 'Phone',
            AccountId = acc.Id
        );
        insert cs;

        // Step 3: Fetch CaseNumber (it's system-generated after insert)
        cs = [SELECT Id, CaseNumber, AccountId FROM Case WHERE Id = :cs.Id];

        // Step 4: Call the method under test
        List<Case> caseList = new List<Case>{cs};
        Test.startTest();
        accountContactUpdate.createCase(caseList); // Replace with your actual class name
        Test.stopTest();

        // Step 5: Assert the Account was updated with CaseNumber as Description
        Account updatedAcc = [SELECT Id, Description FROM Account WHERE Id = :acc.Id];
        System.assertEquals(cs.CaseNumber, updatedAcc.Description, 'Account Description should match CaseNumber');
    }
    
   @isTest
static void accountMedia() {
    // Step 1: Create test data
    List<Account> accList = new List<Account>();
    Account acc = new Account(Name = 'Test', Industry = 'Media');
    accList.add(acc);
    
    insert accList;

    // Step 2: Run the method under test
    Test.startTest();
    accountMediaHot.updateMediaAccounts(accList);
    Test.stopTest();

    // Step 3: Query and verify the results
    Account updatedAcc = [SELECT Id, Name, Rating, Industry FROM Account WHERE Id = :acc.Id];
    System.assertEquals('Hot', updatedAcc.Rating, 'The account rating should be Hot');
}
    
@isTest
    static void updateOpp(){
        list<opportunity>Opplist = new list<Opportunity>();
        Opportunity opp = new Opportunity(Name = 'xyz', closeDate = system.today(),stageName = 'prospecting', Amount = 10000);
        oppList.add(opp);
        insert oppList;
        
        Test.StartTest();
        opportunityAmountupdatee.opportunityAmountupdatee(oppList);
        Test.StopTest();
        
        Opportunity Opp1 = [select id, name,amount, stagename from opportunity where id =: Opp.id];
        system.assertEquals('Needs Analysis', Opp1.StageName,'tets');
    }
}