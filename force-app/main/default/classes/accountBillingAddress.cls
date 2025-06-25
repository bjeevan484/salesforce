public with sharing class accountBillingAddress {
    public static void copyBillingToShipping(List<Account> accList) {
        for (Account acc : accList) {
            if (acc.Copy_to_Shipping_Address__c == true) {
                if (
                    acc.BillingStreet != null &&
                    acc.BillingCity != null &&
                    acc.BillingState != null &&
                    acc.BillingPostalCode != null &&
                    acc.BillingCountry != null
                ) {
                    acc.ShippingStreet = acc.BillingStreet;
                    acc.ShippingCity = acc.BillingCity;
                    acc.ShippingState = acc.BillingState;
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                    acc.ShippingCountry = acc.BillingCountry;
                }
            }
        }
    }
}