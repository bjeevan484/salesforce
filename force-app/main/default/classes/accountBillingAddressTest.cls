@isTest
private class AccountBillingAddressTest {
    @isTest static void testCopyBillingToShipping() {
        // Create an Account with billing address fields set
        Account acc = new Account(
            Name = 'Test Account',
            BillingStreet = '123 Billing Lane',
            BillingCity = 'Hyderabad',
            BillingState = 'TG',
            BillingPostalCode = '500084',
            BillingCountry = 'India'
        );

        // Insert the account (this should invoke the trigger)
        insert acc;

        // Fetch the inserted record from the database
        Account insertedAcc = [SELECT ShippingStreet, ShippingCity, ShippingState, 
                               ShippingPostalCode, ShippingCountry 
                               FROM Account WHERE Id = :acc.Id];

        // Assert that shipping fields were copied correctly
        System.assertEquals('123 Billing Lane', insertedAcc.ShippingStreet);
        System.assertEquals('Hyderabad', insertedAcc.ShippingCity);
        System.assertEquals('TG', insertedAcc.ShippingState);
        System.assertEquals('500084', insertedAcc.ShippingPostalCode);
        System.assertEquals('India', insertedAcc.ShippingCountry);
    }
}