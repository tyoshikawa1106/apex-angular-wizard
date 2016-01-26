public with sharing class AngularWizardHelper {
    
    /**
     * コンストラクタ
     */
    public AngularWizardHelper() {
        
    }

    /**
     * 登録用の添付ファイル情報取得
     */
    public Attachment getAttachment(String fileName, Blob uploadFile, Id parentId) {
        if (String.isEmpty(parentId)) {
            return new Attachment();
        }

        Attachment attachment = new Attachment(
             Name = fileName
            ,Body = uploadFile
            ,ParentId = parentId
        );

        return attachment;
    }
}