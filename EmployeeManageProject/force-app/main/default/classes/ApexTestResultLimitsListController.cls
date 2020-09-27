public with sharing class ApexTestResultLimitsListController {
    public List<ApexTestResultLimits> testResultLimits {get; private set; }

    public ApexTestResultLimitsListController() {
        this.testResultLimits = [
            select 
                ApexTestResultId, AsyncCalls, Callouts, Cpu, Dml, DmlRows, Email
                , LimitContext, LimitExceptions, MobilePush, QueryRows, Soql, Sosl
            from ApexTestResultLimits
        ];
    }
}
