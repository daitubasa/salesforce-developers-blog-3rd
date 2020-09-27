public with sharing class ApexTestResultListController {
    public List<ApexTestResult> testResults {get; private set; }
    
    public ApexTestResultListController() {
        this.testResults = [
            select 
                ApexClassId, ApexLogId, ApexTestRunResultId, AsyncApexJobId
                , Message, MethodName, Outcome, QueueItemId, RunTime
                , StackTrace, TestTimestamp
            from ApexTestResult
        ];
    }
}