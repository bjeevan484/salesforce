trigger AccTrig on Contact (after insert) {
ConAccInsert.Cont(Trigger.new);
}