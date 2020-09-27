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
}