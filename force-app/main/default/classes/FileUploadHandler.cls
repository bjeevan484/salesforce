public with sharing class FileUploadHandler {
    
    public static String uploadFile(String parentId, String documentId, String fileName){
        try {
            System.debug('parentId : ' + parentId);
            System.debug('documentId : ' + documentId);
            System.debug('fileName : ' + fileName);
            // Query the ContentVersion record
            ContentVersion cv = [SELECT Id, Title FROM ContentVersion WHERE ContentDocumentId =:documentId LIMIT 1];

            // Update the Title field
            cv.Title = fileName;

            // Perform the update
            update cv;

            //Create ContentDocumentLink 
            ContentDocumentLink cdl = New ContentDocumentLink();
            cdl.LinkedEntityId = parentId;
            cdl.ContentDocumentId = documentId;
            cdl.shareType = 'V';
            Insert cdl;
 
            return parentId;
        } catch(Exception e) {
            System.debug('error in FileUploadHandler.uploadFile');
            System.debug('error line number : ' + e.getLineNumber());
            System.debug('error error message : ' + e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }
    
   
    public static String deleteUploadedFiles(List<String> lstDocumentId) {
        try {
            System.debug('docs id : ' + lstDocumentId);
            List<ContentDocument> lstDocuments = [SELECT Id, Title FROM ContentDocument WHERE Id IN: lstDocumentId];
            delete lstDocuments;
            
            return 'success';
        } catch(Exception e) {
            System.debug('error in FileUploadHandler.deleteUploadedFiles');
            System.debug('error line number : ' + e.getLineNumber());
            System.debug('error message : ' + e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    public static List<wrap_file_status> file_limit_check(List<String> docIds) {
        try {
            List<ContentDocument> doc = [SELECT Id, Title, ContentSize FROM ContentDocument WHERE Id IN :docIds];
            
            List<wrap_file_status> wrapList = new List<wrap_file_status>();
            for (ContentDocument cd : doc) {
                Integer size = cd.ContentSize;
                String status = size <= MAX_FILE_SIZE ? 'success' : 'error';

                wrap_file_status wrap = new wrap_file_status();
                wrap.status = status;
                wrap.size = size;
                wrap.name = cd.Title;
                wrap.id = cd.Id;
                wrap.accept = status == 'success';
                
                wrapList.add(wrap);
            }
            
            return wrapList;
        } catch (Exception e) {
            system.debug('error type: ' + e.getTypeName());
            system.debug('error line number: ' + e.getLineNumber());
            system.debug('error message: ' + e.getMessage());
            throw new AuraHandledException(e.getTypeName() + ' : ' + e.getMessage());
        }
    }
    
    public class wrap_file_status {
        
        public String status { get;set; }
        
        public Integer size { get;set; }
        
        public String name { get;set; }
         
        public String id { get;set; }
        
        public Boolean accept { get;set; }
       
        public String content { get;set; }
    }
    
    private static final Integer MAX_FILE_SIZE = 9437184; // 9 MB in bytes

}