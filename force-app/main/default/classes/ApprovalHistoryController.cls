public with sharing class ApprovalHistoryController {
    @AuraEnabled(cacheable=true)
    public static List<Map<String,String>> getApprovalComments(Id recordId) {
        SObjectType sObjectType = recordId.getSObjectType();
        String sObjectTypeName = sObjectType.getDescribe().getName();

        List<Map<String,String>> approvalHistoryList = new List<Map<String,String>>();
        Id targetObjectId;

        if (sObjectTypeName == 'ProcessInstanceWorkitem') {
            ProcessInstanceWorkitem step = [SELECT Id, ProcessInstance.TargetObjectId FROM ProcessInstanceWorkitem WHERE Id = :recordId];
            targetObjectId = step.processInstance.TargetObjectId;
        } else if (sObjectTypeName == 'ProcessInstanceStep') {
            ProcessInstanceStep step = [SELECT Id, ProcessInstance.TargetObjectId FROM ProcessInstanceStep WHERE Id = :recordId];
            targetObjectId = step.processInstance.TargetObjectId;
        }

        if (targetObjectId != null) {
            Map<Id,ProcessInstance> processInstances = new Map<Id,ProcessInstance>([
                SELECT Id, Status, ProcessDefinition.Name,
                (SELECT ID, ProcessNodeId, StepStatus, Comments, TargetObjectId, ActorId, CreatedById, 
                        IsDeleted, OriginalActor.Name, OriginalActorId, ProcessInstanceId, RemindersSent, 
                        CreatedDate, Actor.Name, IsPending, ProcessNode.Name 
                 FROM StepsAndWorkitems
                 ORDER BY CreatedDate DESC)
            FROM ProcessInstance
            WHERE TargetObjectId = :targetObjectId
            ORDER BY CreatedDate DESC
            ]); 

            for(ProcessInstance processInstance :  processInstances.values()) {
                for(ProcessInstanceHistory history : processInstance.StepsAndWorkitems) {
                    Map<String,String> instanceMap = new Map<String,String>();
                    instanceMap.put('OriginalActorName', history.OriginalActor.Name);
                    instanceMap.put('Comments', history.Comments);
                    
                    // Check if the step name is empty
                    if (String.isBlank(history.ProcessNode.Name)) {
                        instanceMap.put('ProcessNodeName', 'Approval Request Submitted');
                    } else {
                        instanceMap.put('ProcessNodeName', history.ProcessNode.Name);
                    }
                    
                    approvalHistoryList.add(instanceMap);
                }
            }
            
            
        }

        System.debug('Approval History List ->' + approvalHistoryList);
        return approvalHistoryList.isEmpty() ? null : approvalHistoryList;
    }

    private void TestMethod_c() {
        ApprovalHistoryController.getApprovalComments('04hBg000000Vlx7IAC');
    }
}