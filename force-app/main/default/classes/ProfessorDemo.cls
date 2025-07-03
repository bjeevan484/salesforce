Public Class ProfessorDemo{
    Public static void Subject(list<Professor__c>VarSubjectList){
        For(Professor__c VarValue : VarSubjectList){
            If(VarValue.Name == 'Suresh'){
                VarValue.subject__c =  'Testing';
            }
            else If(VarValue.Name == 'Harish'){
                varValue.subject__c = 'Java';
            }
        }
    }
}