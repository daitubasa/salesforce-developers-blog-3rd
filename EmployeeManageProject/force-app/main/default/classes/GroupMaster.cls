// 本当は Group にしたかったが、予約ごとのことなので、渋々につけた名前「GroupMaster」に
public class GroupMaster {

    public Id id{get; private set;}
    public GroupCode code {get; private set;}
    public GroupName name {get; private set;}
    public GroupSortOrder sortOrder {get; private set;}

    public GroupMaster(Id id, GroupCode code, GroupName name, GroupSortOrder sortOrder) {
        if(id == null) throw new IllegalArgumentException('IDが未設定');
        if(name == null) throw new IllegalArgumentException('グループ名が未設定');
        if(code == null) throw new IllegalArgumentException('グループコードが未設定');
        if(sortOrder == null) throw new IllegalArgumentException('並び順が未設定');
        this.id = id;
        this.code = code;
        this.name = name;
        this.sortOrder = sortOrder;
    }

    public Boolean equals(Object obj) {
        if(this == obj) {
            return true;
        }
        if (obj != null && obj instanceof GroupMaster) {
            GroupMaster other = (GroupMaster)obj;
            return id == other.id && code.equals(other.code) && name.equals(other.name) && sortOrder.equals(other.sortOrder);
        }
        return false;
    }
    
    public override String toString() {
        String str = '';
        str += String.format('salesforce ID:{0}, ', new List<Object> {id});
        str += String.format('コード:{0}, ', new List<Object> {code});
        str += String.format('名前:{0}, ', new List<Object> {name});
        str += String.format('表示準:{0}, ', new List<Object> {sortOrder});
        return str;
    }

    public Boolean sameAs(GroupMaster other) {
        return code.equals(other.code);
    }
}
