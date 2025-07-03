public class ComputerCapacityClass {
    public Static void Capacity(List<Computer_Capacity__c>VarCapacity){
        For(Computer_Capacity__c VarValue : VarCapacity){
            If(VarValue.Hard_Disc_In_GB__c < 50 || VarValue.Ram_Capacity__c < 1 || VarValue.Processor_In_GHz__c < 2){
                VarValue.Capacity_status__c = 'Low Capacity';
                
            }
            else {
                varValue.Capacity_status__c = 'Expected Capacity';
            }
        }
    }
}