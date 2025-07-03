public class CustomNotification {

    public static void sendCS(List<Opportunity> oppList) {
        CustomNotificationType cs = [SELECT Id, DeveloperName FROM CustomNotificationType WHERE DeveloperName = 'Custom_Notification' LIMIT 1];
        User notifyUser = [SELECT Id, Name FROM User WHERE Name = 'Jeevan B' LIMIT 1];
         Set<String> recipients = new Set<String>();
        if (notifyUser != null && cs != null) {
           
            recipients.add(notifyUser.Id);
            
            for (Opportunity opp : oppList) {
                if (opp.StageName == 'Closed Won' && opp.type == 'New Customer') {
                    Messaging.CustomNotification notification = new Messaging.CustomNotification();
                    notification.setTitle('Custom Notification for Opportunity ' + opp.Name);
                    notification.setBody('Please check notified opportunity');
                    notification.setNotificationTypeId(cs.Id);
                    notification.setTargetId(opp.Id);
                    notification.send(recipients);
                    
                    System.debug('Notification sent to ' + notifyUser.Name);
                }
            }
        }
    }
}