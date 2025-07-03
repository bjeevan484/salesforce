public class Notification12 {
 @InvocableMethod   
    public static void CustomNotification(list<id>Leadlist){
        CustomNotificationType Notification = [SELECT Id, DeveloperName, CustomNotifTypeName FROM CustomNotificationType Where DeveloperName = 'Custom_Notification'];
        user NotifyUser =[SELECT id,Name FROM User where Name = 'Jeevan B'];
        set<string>Receipient  = new Set<string>();
        if(NotifyUser != null){
            Receipient.add(NotifyUser.id);
        }
        List<Lead> leads = [SELECT Id, LastName, Status, Email FROM Lead WHERE Id IN :LeadList];
        
        for (Lead lead : leads) {
            if(Lead.status!= null && Lead.Email  != null){
                Messaging.customNotification Notify = new Messaging.customNotification();
                Notify.SetTitle('Lead test Notification' +Lead.LastName);
                Notify.setbody('custom notification');
                Notify.setNotificationTypeId(Notification.id);
                Notify.setTargetId(Lead.id);
              Notify.send(Receipient);
            }
        }
        
    }
}