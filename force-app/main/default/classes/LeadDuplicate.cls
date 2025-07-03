public class LeadDuplicate {
    public Static Void Leadup(List<Lead>NewLead){
        list<String>NewCompanySet = New List<String>();
        list<String>NewEmailSet = New List<String>();
        list<String>OldCompanySet= NEw List<String>();
        list<String>OldEmailSet = New List<String>();
        
        for(Lead Lead1 : NewLead){
            NewCompanySet.add(Lead1.Company);
            NewEmailSet.add(Lead1.Email);
        }
        list<Lead>Lead2 = [Select id,Company,Email From Lead Where Company IN : NewCompanySet OR Email IN: NewEmailSet];
        for(Lead Lead3 : Lead2){
            OldCompanySet.add(Lead3.Company);
            OldEmailSet.add(Lead3.Email);
        }
        for(Lead Lead1 : NewLead){
            if(OldCompanySet.Contains(Lead1.Company)){
                Lead1.Company.addError('Dup Found');
              
            } 
              If(OldEmailSet.contains(Lead1.Email)){
                Lead1.Email.Adderror('Dup Com Found');
            }
        }
        }
    }