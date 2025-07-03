trigger InsertContact on Account (After insert,before insert) {

If(Trigger.IsAfter && Trigger.IsInsert){
AccConInsert.ConInsert(Trigger.new);
}

If(Trigger.IsBefore && Trigger.IsInsert){
DuplicateAccount.Duplicate(Trigger.new);
}
}