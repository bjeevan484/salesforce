trigger LicDupCheck on Life_Insurance_Corporation__c (before insert) {
    if(Trigger.IsInsert && Trigger.IsBefore){
LICmailCheck.Mail(Trigger.new);        
    }

}