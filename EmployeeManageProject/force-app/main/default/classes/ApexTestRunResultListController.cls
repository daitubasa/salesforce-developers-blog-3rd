public with sharing class ApexTestRunResultListController {
    public List<ApexTestRunResult> testRunResults {get; private set; }

    public ApexTestRunResultListController() {
        this.testRunResults = [
            select 
                AsyncApexJobId, ClassesCompleted, ClassesEnqueued, EndTime, IsAllTests
                , JobName, MethodsCompleted, MethodsEnqueued, MethodsFailed, Source
                , StartTime, Status, TestTime, UserId
            from ApexTestRunResult
        ];

    }
}