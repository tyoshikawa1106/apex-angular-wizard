@isTest
private class AngularWizardResultTest {
    
    private static User testAdminUser = new User(Id = UserInfo.getUserId());
    
    /**
     * コンストラクタ
     */
    static testMethod void AngularWizardResultTest() {
        
        System.runAs(testAdminUser) {

            Test.startTest();
            
            AngularWizardResult cls = new AngularWizardResult();
            
            Test.stopTest();

            System.assertEquals(String.isEmpty(cls.accountId), true);
        }
    }
}