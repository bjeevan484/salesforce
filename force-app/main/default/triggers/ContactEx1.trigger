trigger ContactEx1 on Contact (before insert) {
 ContactClassEx1.Email(Trigger.new);
}