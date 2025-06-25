trigger accounttrigger on Account (before insert, before update) {
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        accountMediaHot.updateMediaAccounts(Trigger.new);
        accountBillingAddress.copyBillingToShipping(Trigger.new);
    }
}