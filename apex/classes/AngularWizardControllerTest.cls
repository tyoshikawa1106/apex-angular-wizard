@isTest
private class AngularWizardControllerTest {
    
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * コンストラクタ
     */
    static testMethod void AngularWizardControllerTest1() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            AngularWizardController cls = new AngularWizardController();
            
            Test.stopTest();
        }
    }
    
    /**
     * 取引先情報の登録
     */
    static testMethod void doSaveAccountTest1() {
        
        System.runAs(testAdminUser) {
            
            Account account = new Account(Name = 'Salesforce - Tokyo',AccountNumber = 'SF-001');
            System.assertEquals(String.isEmpty(account.Id), true);
            
            AngularWizardWrapper wrapper = new AngularWizardWrapper();
            wrapper.account = account;
            wrapper.fileName = 'sample.png';
            wrapper.uploadFile = Blob.valueOf('Test File');

            Test.startTest();
            
            AngularWizardResult result = AngularWizardController.doSaveAccount(wrapper);
            
            Test.stopTest();
            
            System.assertEquals(String.isNotEmpty(result.accountId), true);
        }
    }
    
    /**
     * 取引先情報の登録
     */
    static testMethod void doSaveAccountTest2() {
        
        System.runAs(testAdminUser) {
            
            Account account = new Account(Name = '',AccountNumber = 'SF-001');
            System.assertEquals(String.isEmpty(account.Id), true);
            System.assertEquals(String.isEmpty(account.Name), true);
            
            AngularWizardWrapper wrapper = new AngularWizardWrapper();
            wrapper.account = account;
            wrapper.fileName = 'sample.png';
            wrapper.uploadFile = Blob.valueOf('Test File');

            Test.startTest();
            
            AngularWizardResult result = AngularWizardController.doSaveAccount(wrapper);
            
            Test.stopTest();
            
            System.assertEquals(String.isEmpty(result.accountId), true);
        }
    }
}