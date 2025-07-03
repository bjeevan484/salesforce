public class emailController {
    public string toMail{set;get;}
    public string CCMail{set;get;}
    public string repMail{set;get;}
    
    public void EmailDemo(){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String[] to = new string[] {toMail};
            string[] cc = new string[] {CCMail};
                
        email.setSubject('Congrats');
        email.setHtmlBody('Dear Customer,<br/><br/>This is auto generated mail<br/>');
        
        
Tomail = '';
CcMail = '';
repMail = '';

    }
}