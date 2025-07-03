trigger accountContactCount on Contact (after insert, after update , after delete, after undelete) {
 Set<Id> accountIdsToUpdate = new Set<Id>();
    
    // Collect Account IDs from the related Contacts
    if (Trigger.isInsert || Trigger.isDelete || Trigger.isUndelete) {
        for (Contact contact : Trigger.new) {
            accountIdsToUpdate.add(contact.AccountId);
        }
    }
    if (Trigger.isDelete) {
        for (Contact contact : Trigger.old) {
            accountIdsToUpdate.add(contact.AccountId);
        }
    }
    
    // Query and update the Number of Contacts on related Accounts
    List<Account> accountsToUpdate = new List<Account>();
    for (Id accountId : accountIdsToUpdate) {
        accountsToUpdate.add(new Account(
            Id = accountId,
            Number_of_Contacts__c = [SELECT COUNT() FROM Contact WHERE AccountId = :accountId]
        ));
    }
    
    update accountsToUpdate;

}