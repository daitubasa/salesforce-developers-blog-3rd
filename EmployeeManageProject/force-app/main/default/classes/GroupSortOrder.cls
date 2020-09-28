public class GroupSortOrder {
    private Integer value {get; private set;}

    public GroupSortOrder(Integer value) {
        if(value == null) throw new IllegalArgumentException('引数が null');
        this.value = value;
    }

    public Boolean equals(Object obj) {
        if(this == obj) {
            return true;
        }
        if (obj != null && obj instanceof GroupSortOrder) {
            GroupSortOrder other = (GroupSortOrder)obj;
            return value == other.value;
        }
        return false;
    }

    public override String toString() {
        return value.format();
    }
}