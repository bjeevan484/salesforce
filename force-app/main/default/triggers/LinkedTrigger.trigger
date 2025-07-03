trigger LinkedTrigger on Linkedin_com_Application__c (before update) {

    If(Trigger.Isupdate){
        for(Linkedin_com_Application__c  Linked : Trigger.new){
            if(Linked.Country_of_Job__c == 'IND' ){
                Linked.About_Previous_Job__c = 'Job from India';           
            }
        }
    }
}