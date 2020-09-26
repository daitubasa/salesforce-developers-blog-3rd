
// 本来はインターフェイスで定義し実装は別クラスで定義なのですが端折っております。許して
public inherited sharing class EmployeeRepository {

    private EmployeeConverter converter = new EmployeeConverter();

    public EmployeeRepository() {}

    public Employees getAll() {
        List<Employee__c> employeeList = [
            select 
                Id, Name, Code__c, FanNickname__c
                , Group__r.Id, Group__r.Name, Group__r.Code__c, Group__r.SortOrder__c
                , HireDate__c, ImageURL__c, Kana__c, RetirementDate__c, Twitter__c, YouTube__c
            from Employee__c 
            order by Code__c
            ];

        return converter.createEmployees(employeeList);
    }

    public void store(EmployeeDifferences differences) {
        
        List<Employee__c> insertList = new List<Employee__c>();
        List<Employee__c> updateList = new List<Employee__c>();
        List<Employee__c> deleteList = new List<Employee__c>();

        for(Iterator<EmployeeDifference> iterator = differences.Iterator(); iterator.hasNext();) {
            EmployeeDifference difference = iterator.next();
            if(difference.hasDifference()) {
                Employee__c employee = converter.createAfterEmployee(difference);
                if(difference.isNew()) {
                    insertList.add(employee);
                } else if(difference.isChange()){
                    updateList.add(employee);
                } else if(difference.isDeleted()){
                    deleteList.add(employee);
                }
            }
        }

        delete deleteList;
        update updateList;
        insert insertList;
    }
}
