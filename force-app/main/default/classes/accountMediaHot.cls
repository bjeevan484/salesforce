public with sharing class accountMediaHot {
    public static void updateMediaAccounts(List<Account> newAccounts) {
        for (Account acc : newAccounts) {
            if (acc.Industry == 'Media' && acc.Industry !=null) {
                acc.Rating = 'Hot';
            }
        }
    }
}