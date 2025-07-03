public class ParkersClass {
    public static void Pen(list<Peter_Parkers_Pen__c>NewPen){
        for(Peter_Parkers_Pen__c Pen1:NewPen){
            if(Pen1.Quantity__c >= 25){
                pen1.Discount__c = 10;
            }
                else{
                    Pen1.Discount__c = 50;
                  
                }
            update pen1;
             
        }
    }
}