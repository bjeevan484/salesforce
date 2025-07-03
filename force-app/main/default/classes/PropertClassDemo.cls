Public Class PropertClassDemo{
    Public static void Discount(list<Property__c>VarPropertyList){
        For(Property__c VarP : VarPropertyList){
            If(varp.Type_of_Property__c == 'Raw House'){
                   VarP.Price__c = VarP.Price__c - (VarP.Price__c * 0.05);
                system.debug('Raw House is called');
                    }
        
            else if(varp.Type_of_Property__c == 'Villa'){
                VarP.Price__c = VarP.Price__c - (VarP.Price__c * 0.15);
                  system.debug('Villa of 0.15% discount  is called');
            }
            else {
             VarP.Price__c = VarP.Price__c - (VarP.Price__c * 0.25);   
                  system.debug('Others with 0.25 Discount is called');
            }
                   }
                 }
               }