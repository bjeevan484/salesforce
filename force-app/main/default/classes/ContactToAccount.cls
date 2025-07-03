public class ContactToAccount {
    public static void ConInsert(List<Contact>ConList){
        list<Account>AccList = New List<Account>();
        if(recursive.flag == false){
        for(contact Con : conlist){
           Account Acc = New Account();
            Acc.name = con.LastName;
            Acc.Id = con.AccountId;
          
            Acc.Phone = con.Phone;
            AccList.add(Acc);
        }
        insert AccList;
    }
}
}