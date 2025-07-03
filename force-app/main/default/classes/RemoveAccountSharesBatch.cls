global class RemoveAccountSharesBatch implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // Query for accounts where the restriction end date has passed
        Date today = System.today();
        return Database.getQueryLocator([
            SELECT Id FROM Account WHERE Restriction_End_Date__c <= :today
        ]);
    }

    global void execute(Database.BatchableContext bc, List<SObject> scope) {
        // List to hold AccountShare records to be deleted
        List<AccountShare> sharesToDelete = new List<AccountShare>();

        for (Account acc : (List<Account>) scope) {
            // Find the existing share records for Tim B
            List<AccountShare> existingShares = [SELECT Id FROM AccountShare WHERE AccountId = :acc.Id AND UserOrGroupId = :UserInfo.getUserId() AND RowCause =: Schema.AccountShare.RowCause.Manual];
            sharesToDelete.addAll(existingShares);

            // Clear the restriction end date
            acc.Restriction_End_Date__c = null;
        }

        // Delete expired sharing records
        if (!sharesToDelete.isEmpty()) {
            delete sharesToDelete;
        }

        // Update accounts to clear the restriction end date
        if (!scope.isEmpty()) {
            update scope;
        }
    }

    global void finish(Database.BatchableContext bc) {
        // Optionally log or send notification upon completion
    }
}