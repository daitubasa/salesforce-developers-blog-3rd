public class ImportEmployee {

    // 本来 Stringで定義されているメンバーは独自のクラスを定義(入社日なら HireDateクラス)しますが端折っています。
    // 許して
    public String name {get; private set;}
    public String kana {get; private set;}
    public String code {get; private set;}

    public Date hireDate {get; private set;}
    public Date retirementDate {get; private set;}
    public String belongGroupCode {get; private set;}

    public String imageURL {get; private set;}
    public String twitterURL {get; private set;}
    public String youTubeURL {get; private set;}
    public String fanNickname {get; private set;}

    public ImportEmployee(String name, String kana, String code
        , Date hireDate, Date retirementDate, String belongGroupCode
        , String imageURL, String twitterURL, String youTubeURL, String fanNickname) {
            if(name == null) throw new IllegalArgumentException('社員名が未設定');
            if(code == null) throw new IllegalArgumentException('社員コードが未設定');
            if(hireDate == null) throw new IllegalArgumentException('入社日が未設定');

            this.name = name;
            this.kana = kana;
            this.code = code;

            this.hireDate = hireDate;
            this.retirementDate = retirementDate;
            this.belongGroupCode = belongGroupCode;

            this.imageURL = imageURL;
            this.twitterURL = twitterURL;
            this.youTubeURL = youTubeURL;
            this.fanNickname = fanNickname;
    }
    
    public EmployeeDifference getDifference(Employees employees) {
        for(Iterator<Employee> iterator = employees.Iterator(); iterator.hasNext();) {
            Employee employee = iterator.next();
            if(this.code == employee.code) {
                return getDifference(employee);
            }
        }
        return getDifference((Employee)null);
    }
    public EmployeeDifference getDifference(Employee employee) {
        return new EmployeeDifference(this, employee);
    }

    public override String toString() {
        String str = '';
        str += String.format('コード:{0}, ', new List<Object> {code});
        str += String.format('氏名:{0}, ', new List<Object> {name});
        str += String.format('かな:{0}, ', new List<Object> {kana});

        str += String.format('入社日:{0}, ', new List<Object> {hireDate});
        str += String.format('退社日:{0}, ', new List<Object> {retirementDate});
        str += String.format('所属グループ:{0}, ', new List<Object> {belongGroupCode});

        str += String.format('画像URL:{0}, ', new List<Object> {imageURL});
        str += String.format('twitter:{0}, ', new List<Object> {twitterURL});
        str += String.format('youTube:{0}, ', new List<Object> {youTubeURL});
        str += String.format('ファン愛称:{0}, ', new List<Object> {fanNickname});
        return str;
    }
}