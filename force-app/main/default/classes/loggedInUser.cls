public with sharing class loggedInUser {
   @AuraEnabled
    public static User getUserInfo() {
        return [
            SELECT Id, Name, Email, Profile.Name
            FROM User
            WHERE Id = :UserInfo.getUserId()
            WITH SECURITY_ENFORCED
        ];
    }
}