public class penDuplicateClass {
    public static void Pen(list<Peter_Parkers_Pen__c>Pen1){
        list<Decimal>newPriceSet = new list<Decimal>();
        list<Decimal>ExistingPriceSet = new List<Decimal>();
        list<String>NewEmailSet = new List<String>();
        list<String>ExistingMailSet = New List<String>();
        
        for(Peter_Parkers_Pen__c Pen2 : Pen1){
            if(pen2.Price__c != null){
               newPriceSet.add(pen2.Price__c);
                newEMailSet.add(pen2.Customer_Email__c);
            }
        }
        
        
        list<Peter_Parkers_Pen__c>ExistingPenList = [SELECT Price__c,Customer_Email__c FROM Peter_Parkers_Pen__c WHERE Price__c IN : newPriceSet OR Customer_Email__c IN : NewEmailSet];
        for(Peter_parkers_pen__c PenList : ExistingPenList){
           ExistingPriceSet.add(PenList.Price__c);
           ExistingMailSet.add(penList.Customer_Email__c);
            
        }
        
        
        for(Peter_Parkers_Pen__c Pen2 : Pen1){
            if(ExistingPriceSet.contains(pen2.Price__c) ){
                pen2.Price__c.AddError('Duplicate Price Found');
            }
            if(ExistingmailSet.contains(pen2.Customer_Email__c)){
                pen2.Customer_Email__c.AddError('Dup Mail Found');
                
            }
                
            }
        }
    }