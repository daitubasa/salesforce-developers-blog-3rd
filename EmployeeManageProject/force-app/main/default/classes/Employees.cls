public class Employees implements iterable<Employee> {

    private List<Employee> my_list;

    public Employees() {
        this.my_list = new List<Employee>();
    }
    
    public Employees(List<Employee> l) {
        this.my_list = l;
    }

    public Iterator<Employee> Iterator(){
        return my_list.iterator();
    }
}