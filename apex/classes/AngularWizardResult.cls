public with sharing class AngularWizardResult {

    public Id accountId {get; set;}
    public List<String> errorMessages {get; set;}

    /**
     * コンストラクタ
     */
    public AngularWizardResult() {
        this.accountId = null;
        this.errorMessages = new List<String>();
    }
}