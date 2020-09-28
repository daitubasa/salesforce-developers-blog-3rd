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
        if(isNew() || isDeleted()) return false;

        if(importEmployee.name != employee.name) return true;
        if(importEmployee.kana != employee.kana) return true;
        if(importEmployee.code != employee.code) return true;

        if(importEmployee.hireDate != employee.hireDate) return true;
        if(importEmployee.retirementDate != employee.retirementDate) return true;
        if(importEmployee.belongGroupCode != employee.belongGroup.code.toString()) return true;  // TODO: 一旦toString() で比較、後で修正

        if(importEmployee.imageURL != employee.image.toExternalForm()) return true;
        if(importEmployee.twitterURL != employee.twitter.toExternalForm()) return true;
        if(importEmployee.youTubeURL != employee.youTube.toExternalForm()) return true;
        if(importEmployee.fanNickname != employee.fanNickname) return true;
        return false;
    }
    public boolean hasDifference() {
        return (isNew() || isDeleted() || isChange()) ? true : false;
    }

    public override String toString() {
        String str = '';
        str += String.format('hasDifference():{0}, ', new List<Object> {hasDifference()});
        str += String.format('isNew():{0}, ', new List<Object> {isNew()});
        str += String.format('isDeleted():{0}, ', new List<Object> {isDeleted()});
        str += String.format('isChange():{0}, ', new List<Object> {isChange()});
        str += String.format('ImportEmployee:\'{\'{0}\'}\', ', new List<Object> {importEmployee});
        str += String.format('Employee:\'{\'{0}\'}\', ', new List<Object> {employee});
        return str;
    }
}