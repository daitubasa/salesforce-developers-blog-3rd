public class GroupName {
    private String value {get; private set;}

    public GroupName(String value) {
        if(value == null) throw new IllegalArgumentException('引数が null');
        this.value = value;
    }

    public Boolean equals(Object obj) {
        if(this == obj) {
            return true;
        }
        if (obj != null && obj instanceof GroupName) {
            GroupName other = (GroupName)obj;
            return value.equals(other.value);
        }
        return false;
    }
    
    public override String toString() {
        return value;
    }
}
