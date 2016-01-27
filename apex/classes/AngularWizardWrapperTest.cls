@isTest
private class AngularWizardWrapperTest {
    
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * コンストラクタ
     */
    static testMethod void AngularWizardWrapperTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            AngularWizardWrapper cls = new AngularWizardWrapper();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.fileName), true);
        }
    }
}