public with sharing class UserListClass {
	   @AuraEnabled
    public static string getUser() {
        Id userId = userInfo.getUserId();
        String userName = [SELECT id,FirstName, LastName FROM User  where Id=:UserId].FirstName;
        return userName;
    }
}