public class ContactClassEx1 {
    public static void Email(list<contact>scope){
        for(contact con : scope){
            if(con.Department == 'CSE'){
                con.Email = 'bjeevan484@gmail.com';
                
            }
        }
        
    }
}