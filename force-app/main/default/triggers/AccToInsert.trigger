trigger AccToInsert on Contact (after insert) {
    ContactToAccount.ConInsert(Trigger.new);
}