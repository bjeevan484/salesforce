trigger ContactTri on Contact (After insert, After Update) {

If(Trigger.IsAfter && Trigger.IsInsert|| Trigger.IsAfter && Trigger.IsUpdate){
ConOppInsert.Con(Trigger.New);   
} 
}