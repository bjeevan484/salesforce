public class AccConInsert {
    public static void ConInsert(list<Account>AccList){
        list<contact>ConList = New List<Contact>();
        for(Account VarValue : AccList){
            contact con = new contact();
            varValue.Name = con.Name;
            VarValue.Phone = con.Phone;
            
            conList.add(con);
        }
        insert conList;
    }
}