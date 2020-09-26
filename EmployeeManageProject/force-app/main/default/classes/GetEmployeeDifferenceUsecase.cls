/**
 * ・ユーザは、画面から新しい社員情報を入力します。  
 *　salesforce は、入力された社員情報と社員コードが一致する登録済みの情報を取得し比較した結果を返します。  
 */
public inherited sharing class GetEmployeeDifferenceUsecase {

    private EmployeeRepository employeeRepository = new EmployeeRepository();

    // 引数：importEmployeesについて
    //  画面から入力した新しい社員情報は csvファイルのテキスト情報からコンバートされた後としています。
    public EmployeeDifferences execute(ImportEmployees importEmployees) {

        Employees employees = employeeRepository.getAll();
        return importEmployees.getDifferences(employees);
    }
}