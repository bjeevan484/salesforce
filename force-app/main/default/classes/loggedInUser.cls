public with sharing class LoggedInUser {
    @AuraEnabled(cacheable=true)
    public static User getUserInfo() {
        return [
            SELECT Id, Name, Username, Alias, IsActive
            FROM User
            WHERE Id = :UserInfo.getUserId()
        ];
    }
}