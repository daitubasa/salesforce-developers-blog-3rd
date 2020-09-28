// 本当は Group にしたかったが、予約ごとのことなので、渋々につけた名前「GroupMaster」に
public class GroupMaster {

    public Id id{get; private set;}
    public String name {get; private set;}
    public String code {get; private set;}
    public Integer sortOrder {get; private set;}

    public GroupMaster(Id id, String code, String name, Integer sortOrder) {
        if(id == null) throw new IllegalArgumentException('IDが未設定');
        if(name == null) throw new IllegalArgumentException('グループ名が未設定');
        if(code == null) throw new IllegalArgumentException('グループコードが未設定');
        if(sortOrder == null) throw new IllegalArgumentException('並び順が未設定');
        this.id = id;
        this.code = code;
        this.name = name;
        this.sortOrder = sortOrder;
    }
}
