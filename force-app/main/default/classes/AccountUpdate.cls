public class AccountUpdate {
    public static void updateAccountOwner(List<Contact> newContacts) {
        List<Account> accountsToUpdate = new List<Account>();

        for (Contact con : newContacts) {
            if (con.AccountId != null) {
                Account acc = new Account();
                acc.Id = con.AccountId;
                acc.OwnerId = con.OwnerId;
                accountsToUpdate.add(acc);
                system.debug('acc '+acc.OwnerId);
                system.debug('con' +con.OwnerId);
            }
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
            system.debug('updated id' +accountsToUpdate);
        }
    }
}