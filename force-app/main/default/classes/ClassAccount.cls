public class ClassAccount {
    Public Static Void Acc(List<Account>NewAccount){
        For(Account Act : NewAccount){
            If(Act.Name != 'Infosys'){
                      Act.Rating = 'Hot';
                Act.Industry = 'Media';
                Act.AccountNumber = 'BNJ654';
                Act.Phone = '1245678930';
            }
		}
        
    }
    Public Static Void Act(List<Account>NewAccountList){
        List<Contact>Con = New list<Contact>();
        for(Account Act : NewAccountList){
            Contact cont = New Contact();
            cont.AccountId = Act.Id;
            cont.LastName = Act.Name;
            cont.Phone = Act.Phone;
            cont.LeadSource = 'Web';
            Con.add(cont);
            
        }
        If(!Con.IsEmpty()){
            Insert Con;
        }
    }
}