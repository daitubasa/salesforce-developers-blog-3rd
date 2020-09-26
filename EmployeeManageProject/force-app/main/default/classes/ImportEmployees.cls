public class ImportEmployees implements iterable<ImportEmployee> {

    private List<ImportEmployee> my_list;

    public ImportEmployees() {
        this.my_list = new List<ImportEmployee>();
    }
    
    public ImportEmployees(List<ImportEmployee> l) {
        this.my_list = l;
    }

    public Iterator<ImportEmployee> Iterator(){
        return my_list.iterator();
    }
    
    public EmployeeDifferences getDifferences(Employees employees) {
        
        List<EmployeeDifference> newList = new List<EmployeeDifference>();
        for(ImportEmployee importEmp : my_list) {
            newList.add(importEmp.getDifference(employees));
        }

        for(Iterator<Employee> iterator = employees.Iterator(); iterator.hasNext();) {
            Employee employee = iterator.next();
            if(!contains(employee)) {
                newList.add(
                    new EmployeeDifference(null, employee)
                );
            }
        }
        return new EmployeeDifferences(newList);
    }

    private boolean contains(Employee employee) {
        for(ImportEmployee importEmp : my_list) {
            if(employee.code == importEmp.code) {
                return true;
            }
        }
        return false;
    }
}