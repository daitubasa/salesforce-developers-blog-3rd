public class EmployeeConverter {
    public EmployeeConverter() {
    }

    public Employees createEmployees(List<Employee__c> employeeList) {
        List<Employee> employees = new List<Employee>();
        for(Employee__c emp : employeeList) {
            GroupMaster belongGroup = new GroupMaster(
                emp.Group__r.Id, new GroupCode(emp.Group__r.Code__c), new GroupName(emp.Group__r.Name)
                , new GroupSortOrder(emp.Group__r.SortOrder__c.intValue())
            );
            employees.add(
                new Employee(
                    emp.Id, emp.Name, emp.Kana__c, emp.Code__c, emp.HireDate__c, emp.RetirementDate__c
                    , belongGroup, emp.ImageURL__c, emp.Twitter__c, emp.YouTube__c, emp.FanNickname__c
                )
            );
        }
        return new Employees(employees);
    }

    public Employee__c createAfterEmployee(EmployeeDifference difference) {

        if(!difference.hasDifference()) throw new IllegalArgumentException('差異がない');

        Employee__c emp;
        if(difference.isDeleted()){
            emp = new Employee__c(
                Id = difference.employee.id
            );
        } else {
            emp = new Employee__c(
                Name = difference.importEmployee.name
                , Kana__c = difference.importEmployee.kana
                , Code__c = difference.importEmployee.code
                , HireDate__c = difference.importEmployee.hireDate
                , RetirementDate__c = difference.importEmployee.retirementDate
                , Group__r = new Group__c(Code__c = difference.importEmployee.belongGroupCode)
                , ImageURL__c = difference.importEmployee.imageURL
                , Twitter__c = difference.importEmployee.twitterURL
                , YouTube__c = difference.importEmployee.youTubeURL
                , FanNickname__c = difference.importEmployee.fanNickname
            );
            if(difference.isChange()) {
                emp.Id = difference.employee.id;
            }
        }
        return emp;
    }
}