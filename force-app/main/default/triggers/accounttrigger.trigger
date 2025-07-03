trigger accounttrigger on Account (before insert, before update, after insert, after update) {
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        accountMediaHot.updateMediaAccounts(Trigger.new);
        //accountBillingAddress.copyBillingToShipping(Trigger.new);
       accountContactUpdate.oldMapScenatio(trigger.new, trigger.oldmap);
    }
    if (Trigger.isAfter && Trigger.isInsert) {
    accountContactUpdate.accountContactUpdate(Trigger.new);
   accountContactUpdate.CreateOppotunity(trigger.new);
  //accountContactUpdate.createCase(Trigger.new);
  accountContactUpdate.create(trigger.new);
}
}