public class contactAccount {
  public static void handleBeforeInsert(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        // Collect Account Ids from the new contacts
        for (Contact con : newContacts) {
            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
                system.debug('account id' + con.AccountId);
            }
        }
        
        // Query Accounts to get their Phone numbers
        Map<Id, Account> accounts = new Map<Id, Account>(
            [SELECT Id, Phone FROM Account WHERE Id IN :accountIds]
        );
        
        // Set the OtherPhone field if it is not populated
        for (Contact con : newContacts) {
            if (con.OtherPhone == null && con.AccountId != null) {
                Account acc = accounts.get(con.AccountId);
                if (acc != null) {
                    con.OtherPhone = acc.Phone;
                    system.debug('contact phone' +con.OtherPhone);
                    system.debug('Account phone' +acc.Phone);
                }
            }
        }
    }
}