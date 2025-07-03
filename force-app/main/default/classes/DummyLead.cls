public class DummyLead {
    public static void DLead(list<Lead>LeadList){
        set<String>OldEmailSet = New Set<String>();
        set<String>NewEmailSet = New Set<String>();
        set<string>OldComSet = New Set<String>();
        set<string>NewComSet = New Set<String>();
        
        for(Lead NewLead : LeadList){
            NewEmailSet.add(NewLead.Email);
            NewComSet.add(NewLead.Company);
        }
        List<Lead>Lead1 = [SELECT id,Name, Email, Company From Lead WHERE Email In : NewEmailSet OR Company IN : NewComSet];
        for(Lead NewLead1 : Lead1){
            oldEmailSet.add(NewLead1.Email);
            oldComSet.add(NewLead1.Company);
        }
        for(Lead NewLead : LeadList){
            If(OldEmailSet.contains(NewLead.Email)){
                NewLead.Email.AddError('Dup found');
            }
        }
            for(Lead NewLead : LeadList){
            If(OldComSet.contains(NewLeaD.Company)){
                nEWlEAD.Company.AddError('Dup Company Found');
            }
        }
    }
}