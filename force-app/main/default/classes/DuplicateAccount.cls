public class DuplicateAccount {
    public static void Duplicate(list<Account>AccList){
        list<String>newAcc = new list<String>();
        list<String>ExistingAccSet = new List<String>();
        
        for(Account Acc : AccList){
            If(Acc.Name != Null){
                newAcc.add(Acc.Name);
            }
        }
        list<Account>ExistingAccList = [SELECT id,Name FROM Account WHERE Name In : NewAcc];
        for(Account Ac : ExistingAccList){
            ExistingAccSet.add(AC.Name);
        }
        for(Account Acc : AccList){
            If(ExistingAccSet.contains(Acc.Name)){
                Acc.Name.AddError('Dummy Found');
            }
        }
    }
}