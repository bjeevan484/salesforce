public class emailutility {
    public static void sendmail(){
        list<Messaging.SingleEmailMessage>MailList = new list<Messaging.SingleEmailMessage>();
        string[]  toadresses = new string[]{'bjeevan484@gmail.com'};
            
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        Mail.setSubject('Learn salesforce');
        mail.setPlainTextBody('Welcome to intelogic');
        mail.setToAddresses(toadresses);
        MailList.add(Mail);
        
        if(!mailList.isEmpty())
            Messaging.sendEmail(mailList);
    }

}