/****************************************************************************************************************************************************************************/

/* Code Name:  AutoConvertLeads.apxc                                                                                                                                      
/*
/*  Task#                                    Date           Version      Updated by                           Comments
/*  Convert Lead based on record type      19-June-2024       0.1        Jeevan B                 Implemented logic to get opportunity record type based on lead record type.
 
/*****************************************************************************************************************************************************************************/

public class AutoConvertLeads {
    @InvocableMethod
    public static void LeadAssign(List<Id> LeadIds) {
        // Query the leads to be converted
        List<Lead> leadsToConvert = [SELECT Id FROM Lead WHERE Id IN :LeadIds];
        system.debug('leadsToConvert: ' + leadsToConvert);

        // Query the converted lead status
        LeadStatus CLeadStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];

        // Prepare the list to hold the lead conversions
        List<Database.LeadConvert> massLeadConvert = new List<Database.LeadConvert>();

        for (Lead lead : leadsToConvert) {
            Database.LeadConvert leadConvert = new Database.LeadConvert();
            leadConvert.setLeadId(lead.Id);
            leadConvert.setConvertedStatus(CLeadStatus.MasterLabel);
            massLeadConvert.add(leadConvert);
        }

        if (!massLeadConvert.isEmpty()) {
            // Convert the leads
            List<Database.LeadConvertResult> lcr = Database.convertLead(massLeadConvert);
            for (Database.LeadConvertResult result : lcr) {
                if (result.isSuccess()) {
                    system.debug('Lead converted successfully: ' + result.getLeadId());
                } else {
                    system.debug('Failed to convert lead: ' + result.getLeadId());
                }
            }
        }
    }
}