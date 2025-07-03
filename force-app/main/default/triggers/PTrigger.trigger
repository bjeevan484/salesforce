trigger PTrigger on Property__c (before Update) {
    If(Trigger.IsUpdate){
        For(Property__c Land : Trigger.new){
            If(Land.Price__c > 50000 && Land.Price__c <= 100000){
                Land.Type_of_Property__c = 'Raw House';  
            }
            
           
          }
    }
}