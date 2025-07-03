public class OppLeadUpdate {
    public static void LeadUpdate(List<Opportunity>OppList){
        list<lead>L1 = new List<Lead>();
        for(Opportunity varValue : OppList){
            lead varLead = new Lead();
            varlead.LastName = VarValue.Name;
            varLead.Company = varValue.StageName;
            L1.add(VarLead);
        }
        insert L1;
    }
}