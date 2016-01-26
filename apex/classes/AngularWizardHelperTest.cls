@isTest
private class AngularWizardHelperTest {
    
    private static AngularWizardHelper helper = new AngularWizardHelper();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * 登録用の添付ファイル情報取得
     * 値なし
     */
    static testMethod void getAttachmentTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            String fileName = 'sample.xls';
            Blob uploadFile = Blob.valueOf('Test File');
            Id parentId = null;
            Attachment result = helper.getAttachment(fileName, uploadFile, parentId);
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(result.Name), true);
        }
    }

    /**
     * 登録用の添付ファイル情報取得
     * 値あり
     */
    static testMethod void getAttachmentTest2() {
        
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'Salesforce - Tokyo');
            insert account;
            System.assertEquals(String.isNotEmpty(account.Id), true);

            Test.startTest();
            
            String fileName = 'sample.xls';
            Blob uploadFile = Blob.valueOf('Test File');
            Id parentId = account.Id;
            Attachment result = helper.getAttachment(fileName, uploadFile, parentId);
            
            Test.stopTest();

            System.assertEquals(result.Name, fileName);
            System.assertEquals(result.ParentId, account.Id);
        }
    }
}