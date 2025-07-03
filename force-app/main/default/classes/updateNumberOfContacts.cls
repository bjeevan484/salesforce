public class updateNumberOfContacts {
    public class ContactHandler 
{
    List<Account> accountList = new List<Account>();
    List<Account> accountListUpdated = new List<Account>();
    public void countContacts(List<Contact> newList)   {
        for (Contact con : newList)  {
            system.debug('ContactsAccountID'+con.AccountId);
            accountList = [SELECT Id,Name,Number_of_Contacts__c, (SELECT Id, Name FROM Contacts) 
                           FROM Account WHERE Id =: con.AccountId];
        }
        for (Account acc : accountList)  {
            acc.Number_of_Contacts__c = acc.Contacts.size() ;
            accountListUpdated.add(acc);
        }
        update accountListUpdated;
    }
}
}