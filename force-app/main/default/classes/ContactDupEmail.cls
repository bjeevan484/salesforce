public class ContactDupEmail {
    public Static Void Mail(list<Contact>ConList){
        for(contact c:ConList) 
			{ 
				list<contact>a=[select id,name,Email,lastname from contact where Email=:c.Email ]; 
					if(a.size()>0) 
						{ 
							c.Email.adderror('already existing'); 

    					}
    			list<Contact>c2 = [SELECT id,name,Email,lastname from contact where LastName =: c.LastName];
    				if(c2.Size()>0){
        					c.LastName.addError('Dup Name ');
    					}
    }
    }
   }