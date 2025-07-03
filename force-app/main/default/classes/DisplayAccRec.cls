public class DisplayAccRec {
@AuraEnabled
public static List<Account>getAccountRecord(){
List<Account>AccList = New List<Account>();
AccList = [SELECT id,Name,Phone,Type from Account Where Type!=Null];
return AccList;
}

}