public with sharing class ApexTestResultListController {
    public List<ApexTestResult> testResults {get; private set; }
    
    public ApexTestResultListController() {
        this.testResults = [
            select 
                ApexClassId, ApexLogId 
            from ApexTestResult
        ];
    }
}