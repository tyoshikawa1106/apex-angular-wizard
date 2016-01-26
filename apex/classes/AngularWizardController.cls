public with sharing class AngularWizardController {
    
    private static AngularWizardHelper helper = new AngularWizardHelper();
    
    /**
     * コンストラクタ
     */
    public AngularWizardController() {
        
    }
    
    /**
     * 取引先情報の登録
     */
    @RemoteAction
    public static AngularWizardResult doSaveAccount(AngularWizardWrapper wrapper) {
        Savepoint sp = Database.setSavepoint();
        AngularWizardResult result = new AngularWizardResult();
        
        try {
	        // 取引先情報取得
            Account account = wrapper.account;
            if (String.isEmpty(account.Name)) {
                result.errorMessages.add('取引先名が未入力です。');
                Database.rollback(sp);
                return result;
            }
            // 取引先登録
            insert account;
            
            // 添付ファイル登録
            Attachment attacment = helper.getAttachment(wrapper.fileName, wrapper.uploadFile, account.Id);
            insert attacment;
            
            // 取引先IDを返す
            result.accountId = account.Id;
        } catch(DmlException e) {
            Database.rollback(sp);
            result.errorMessages.add(e.getDmlMessage(0));
            return result;
        } catch(Exception e) {
            Database.rollback(sp);
            result.errorMessages.add(e.getMessage());
            return result;
        }
        
        return result;
    }
}