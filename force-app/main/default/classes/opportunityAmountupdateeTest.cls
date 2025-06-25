@isTest
private class opportunityAmountupdateeTest {


@IsTest
    static void testOpportunityAmountUpdate() {
        // Create a test opportunity with Amount <= 10000
        Opportunity testOpportunity = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 5000
        );
        insert testOpportunity;

        // Call the opportunityAmountupdatee method
        Test.startTest();
        opportunityAmountupdatee.opportunityAmountupdatee(new List<Opportunity>{testOpportunity});
        Test.stopTest();

        // Retrieve the updated opportunity
        Opportunity updatedOpportunity = [SELECT Id, stagename FROM Opportunity WHERE Id = :testOpportunity.Id];

        // Verify that the Description field is updated
        System.assertEquals('Needs Analysis', updatedOpportunity.stagename);
    }
}