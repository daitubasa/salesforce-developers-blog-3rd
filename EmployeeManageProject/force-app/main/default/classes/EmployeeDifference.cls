public class EmployeeDifference {

    public ImportEmployee importEmployee {get; private set;}
    public Employee employee {get; private set;}
    
    public EmployeeDifference(ImportEmployee importEmployee, Employee employee) {
        if(importEmployee == null && employee == null) {
            throw new IllegalArgumentException('どっちの社員情報も null');
        }
        this.importEmployee = importEmployee;
        this.employee = employee;
    }

    public boolean isNew() {
        return importEmployee != null && employee == null;
    }
    public boolean isDeleted() {
        return importEmployee == null && employee != null;
    }
    public boolean isChange() {
        if(importEmployee == null || employee == null) return false;

        if(importEmployee.name != employee.name) return true;
        if(importEmployee.kana != employee.kana) return true;
        if(importEmployee.code != employee.code) return true;

        if(importEmployee.hireDate != employee.hireDate) return true;
        if(importEmployee.retirementDate != employee.retirementDate) return true;
        String employeeBelongGroupCode = employee.belongGroup == null ? '' : employee.belongGroup.code;
        if(importEmployee.belongGroupCode != employeeBelongGroupCode) return true;

        if(importEmployee.imageURL != employee.image.toExternalForm()) return true;
        if(importEmployee.twitterURL != employee.twitter.toExternalForm()) return true;
        if(importEmployee.youTubeURL != employee.youTube.toExternalForm()) return true;
        if(importEmployee.fanNickname != employee.fanNickname) return true;
        return false;
    }
    public boolean hasDifference() {
        return (isNew() || isDeleted() || isChange()) ? true : false;
    }
}