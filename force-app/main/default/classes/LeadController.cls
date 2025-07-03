public with sharing class LeadController {
    public class LeadResult {
        @AuraEnabled public String status;

        public LeadResult(String status) {
            this.status = status;
        }
    }

    @AuraEnabled
    public static List<LeadResult> createLead(List<Map<String, Object>> leadRecords) {
        List<LeadResult> results = new List<LeadResult>();
        List<Lead> leadsToInsert = new List<Lead>();

        for (Map<String, Object> record : leadRecords) {
            try {
                Lead newLead = new Lead();

                if (record.containsKey('Salutation')) {
                    newLead.Salutation = (String) record.get('Salutation');
                }
                if (record.containsKey('FirstName')) {
                    newLead.FirstName = (String) record.get('FirstName');
                }
                if (record.containsKey('LastName')) {
                    newLead.LastName = (String) record.get('LastName');
                }
                if (record.containsKey('Email')) {
                    newLead.Email = (String) record.get('Email');
                }
                if (record.containsKey('MobilePhone')) {
                    newLead.MobilePhone = (String) record.get('MobilePhone');
                }

                leadsToInsert.add(newLead);
            } catch (Exception e) {
                results.add(new LeadResult('Error'));
            }
        }

        if (!leadsToInsert.isEmpty()) {
            try {
                insert leadsToInsert;
                for (Lead lead : leadsToInsert) {
                    results.add(new LeadResult('Lead created'));
                }
            } catch (DmlException e) {
                for (Integer i = 0; i < e.getNumDml(); i++) {
                    results.add(new LeadResult('Error'));
                }
            } catch (Exception e) {
                results.add(new LeadResult('Error'));
            }
        }

        return results;
    }
}