public class NewAccountToContact {
    public static void Accon(list<Account>Acclist){
        list<contact>ConList = New list<Contact>();
        for(account Acc : Acclist){
            contact con = new contact();
            con.LastName = Acc.Name;
            con.AccountId = Acc.Id;
            conlist.add(con);
        }
        insert conList;
    }
}