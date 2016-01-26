public with sharing class AngularWizardWrapper {
    
    // 取引先
    public Account account {get; set;}
    // ファイル名
    public String fileName {get;set;}
    // ファイルオブジェクト
    public Blob uploadFile {get;set;}
    // ファイルサイズ
    public Long fileSize {get; set;}
    
    /**
     * コンストラクタ
     */
    public AngularWizardWrapper() {
        this.account = new Account();
        this.fileName = '';
        this.uploadFile = null;
        this.fileSize = null;
    }
}