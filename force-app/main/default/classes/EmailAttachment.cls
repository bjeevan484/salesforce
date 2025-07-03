public class EmailAttachment {
    public static void Attachment(List<Contact>Mail){
        for(Contact Con : Mail)
   {
   if(con.Email != null)
     {
        Messaging.SingleEmailMessage mail1 = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[]{con.Email};
       // String[] toAddresses = 'oppr.SMEs_Email__c';

        mail1.setToAddresses(toAddresses);
        mail1.setReplyTo('bjeevan484@gmail.com');
        mail1.setSenderDisplayName('CRM Support');
        mail1.setSubject('Mail with Attachment');
        mail1.setBccSender(false);
        mail1.setUseSignature(false);
        mail1.setPlainTextBody('Your Email has been sent');
        mail1.setTargetObjectId(con.OwnerId);
        
        mail1.saveAsActivity = false;


      //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
       
       
       
      //Set email file attachments
        List<Messaging.Emailfileattachment> fileAttachments = new List<Messaging.Emailfileattachment>();
        for (Attachment a : [select Name, Body, BodyLength from Attachment where ParentId = :Con.Id])
        {
        // Add to attachment file list
        Messaging.Emailfileattachment efa = new Messaging.Emailfileattachment();
        
	efa.setFilename( 'Font.PDF');
	efa.setbody(Blob.valueOf('Unit Test Attachment Body'));
 	fileAttachments.add(efa);
        }
        mail1.setFileAttachments(fileAttachments);

      //Send email
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail1 });
       
}       
        
    }
}
}