/**
 *
 *・ユーザは比較した結果を確認した後、入力した社員情報の登録を行います。  
 *　saleforce は比較結果を元に社員情報の登録 or 更新 or 削除を行います。  
 */
public inherited sharing class RegisterImportEmployeeUsecase {

    private EmployeeRepository employeeRepository = new EmployeeRepository();

    public void execute(EmployeeDifferences differences) {
        employeeRepository.store(differences);
    }
}