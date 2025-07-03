public class WorkerClass {
    Public Static void Worker(List<Workers__c>NewWorker){
        For(Workers__c VarWorker : NewWorker){
            IF(VarWorker.Company__c == 'IBM'){
                VarWorker.Experience__c = 20;
                
                
            }
        }
        
    }

}