public class EmployeeDifference {

    private ImportEmployee importEmployee;
    private Employee employee;
    
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
    public boolean isDifference() {
        return false; // TODO: あとで実装
    }
    public boolean hasDifference() {
        return (isNew() || isDeleted() || isDifference()) ? true : false;
    }
}