public class StudentClass {
    public static void Status(list<Student__c>ExperienceList){
        
        For(Student__c VarValue : ExperienceList){
            If(VarValue.Age__c > 30 || VarValue.Experience__c > 8){
                VarValue.Status__c = 'Selected';
            }
            else {
                VarValue.Status__c = 'Rejected';
            }
        }
        
    }
}