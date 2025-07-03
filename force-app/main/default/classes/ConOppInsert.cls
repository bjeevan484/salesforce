public class ConOppInsert {
    public Static void Con(List<Contact>ConList){
  		list<opportunity>op=[select id,name,stagename,Description,amount from opportunity limit 50]; 
			for(contact c:ConList){ 
				for(opportunity o:op) 
					{ 
						if(o.amount>100000) 
						{	 
							o.amount=o.Amount+25000; 
							o.Name= 'Jeevan' + ' ' + 'Prathyusha' + ' ' + 'Diana'; 
							o.StageName='Need analysis'; 
 						} 
				
                    update o;
				}
   
            }
          
        }
    }