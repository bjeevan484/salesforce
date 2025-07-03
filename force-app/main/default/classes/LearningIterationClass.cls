public class LearningIterationClass {
@AuraEnabled
    public static map<string, List<String>>getMap(){
        map<string, List<String>>MapOfData = New map<string, List<String>>();
        List<String>CloudProducts = New List<String>{'Salesforce', 'AWS'};
             List<String>MobileProducts = New List<String>{'iphone', 'Android'};
       
            List<String>WebApps = New List<String>{'.Net', 'Java'};
                MapOfData.put('CloudProducts', CloudProducts);
        MapOfData.put('MobileProducts', MobileProducts);
        MapOfData.put('WebApps', WebApps);
        
        return MapOfData;
    }
}