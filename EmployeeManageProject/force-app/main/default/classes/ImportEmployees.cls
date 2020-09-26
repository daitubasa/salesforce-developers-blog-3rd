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
    
}