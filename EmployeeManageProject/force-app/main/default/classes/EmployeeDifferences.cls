// iterable インターフェースの仕様は？
public class EmployeeDifferences implements iterable<EmployeeDifference> {

    private List<EmployeeDifference> my_list;

    public EmployeeDifferences() {
        this.my_list = new List<EmployeeDifference>();
    }

    public EmployeeDifferences( List<EmployeeDifference> l) {
        this.my_list = l;
    }

    public Iterator<EmployeeDifference> Iterator(){
        return my_list.iterator();
    }

    public EmployeeDifferences excludeNoDifference() {
        List<EmployeeDifference> newList = new List<EmployeeDifference>();
        for(EmployeeDifference difference : my_list) {
            if(difference.hasDifference()) {
                newList.add(difference);
            }
        }
        return new EmployeeDifferences(newList);
    }

    public override String toString() {
        String str = '';
        Integer i = 0;
        for(EmployeeDifference difference : my_list) {
            str += String.format('[{0}]:\'{\'{1}\'}\', ', new List<Object> {i, difference});
            i++;
        }
        return str;
    }
}