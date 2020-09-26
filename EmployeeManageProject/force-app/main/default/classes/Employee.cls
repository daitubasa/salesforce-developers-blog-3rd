public class Employee {

    // 本来 Stringで定義されているメンバーは独自のクラスを定義(入社日なら HireDateクラス)しますが端折っています。
    // 許して
    public Id id{get; private set;}
    public String name {get; private set;}
    public String kana {get; private set;}
    public String code {get; private set;}

    public Date hireDate {get; private set;}
    public Date retirementDate {get; private set;}
    public GroupMaster belongGroup {get; private set;}

    public URL image {get; private set;}
    public URL twitter {get; private set;}
    public URL youTube {get; private set;}
    public String fanNickname {get; private set;}

    public Employee(Id id, String name, String kana, String code
        , Date hireDate, Date retirementDate, GroupMaster belongGroup
        , String imageURL, String twitterURL, String youTubeURL, String fanNickname) {
            if(id == null) throw new IllegalArgumentException('IDが未設定');
            if(name == null) throw new IllegalArgumentException('社員名が未設定');
            if(code == null) throw new IllegalArgumentException('社員コードが未設定');
            if(hireDate == null) throw new IllegalArgumentException('入社日が未設定');

            this.id = id;
            this.name = name;
            this.kana = kana;
            this.code = code;

            this.hireDate = hireDate;
            this.retirementDate = retirementDate;
            this.belongGroup = belongGroup;

            this.image = new URL(imageURL);
            this.twitter = new URL(twitterURL);
            this.youTube = new URL(youTubeURL);
            this.fanNickname = fanNickname;
    }
}