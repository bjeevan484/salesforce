@isTest
private class accountMediaHotTest {

    @isTest
    static void testMediaIndustryUpdate() {
        // Create a test account with Industry = 'Media'
        Account mediaAcc = new Account(Name = 'Media Corp', Industry = 'Media');
        insert mediaAcc;

        // Re-fetch the account from the database
        Account result = [SELECT Id, Industry, Rating FROM Account WHERE Id = :mediaAcc.Id];

        // Validate that the Rating was updated to 'Hot'
        System.assertEquals('Hot', result.Rating);
        system.debug('result =' + result.Rating);
    }

    @isTest
    static void testNonMediaIndustryNoUpdate() {
        // Create a test account with Industry != 'Media'
        Account nonMediaAcc = new Account(Name = 'Tech Corp', Industry = 'Technology');
        insert nonMediaAcc;

        // Re-fetch the account from the database
        Account result = [SELECT Id, Industry, Rating FROM Account WHERE Id = :nonMediaAcc.Id];

        // Validate that the Rating is not 'Hot'
        System.assertNotEquals('Hot', result.Rating);
    }
}