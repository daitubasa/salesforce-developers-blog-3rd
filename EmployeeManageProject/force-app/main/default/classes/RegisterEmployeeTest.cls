@isTest
private class RegisterEmployeeTest {
    @testSetup 
    static void setup() {
        List<Group__c> groups = new List<Group__c>{
              new Group__c(Code__c = 'TA', SortOrder__c=10, Name = '所属タレント')
            , new Group__c(Code__c = '01', SortOrder__c=20, Name = '1期生')
            , new Group__c(Code__c = '02', SortOrder__c=30, Name = '2期生')
            , new Group__c(Code__c = 'GA', SortOrder__c=40, Name = 'ゲーマーズ')
            , new Group__c(Code__c = '03', SortOrder__c=50, Name = '3期生')
            , new Group__c(Code__c = '04', SortOrder__c=60, Name = '4期生')
            , new Group__c(Code__c = '05', SortOrder__c=70, Name = '5期生')
        };
        insert groups;

        Group__c group3Gen = [select id, name from Group__c where Code__c = '03'];

        List<Employee__c> employees = new List<Employee__c>{
            new Employee__c(Code__c = '000031', Name = '兎田ぺこら', Kana__c = 'うさだぺこら', HireDate__c = Date.newInstance(2019,7,17), Group__c = group3Gen.Id
            , YouTube__c = 'https://www.youtube.com/channel/UC1DCedRgGHBdm81E1llLhOQ'
            , ImageURL__c = 'https://yt3.ggpht.com/a/AATXAJwFs1D2-rT1XPz-fvlO5ZdnkKhPU-Uu6GDwNDn_FA=s288-c-k-c0xffffffff-no-rj-mo'
            , Twitter__c = 'https://twitter.com/usadapekora', FanNickname__c = '野うさぎ同盟'), 
            
            new Employee__c(Code__c = '000003', Name = 'さくらみこ', Kana__c = 'さくらみこ', HireDate__c = Date.newInstance(2018,8,1), Group__c = group3Gen.Id
            , YouTube__c = 'https://www.youtube.com/channel/UC-hM6YJuNYVAmUWxeIr9FeA'
            , ImageURL__c = 'https://yt3.ggpht.com/a/AATXAJyKGBusDmf7stiwXDVORLo21xtnBj2YUHrPd-CxYA=s288-c-k-c0xffffffff-no-rj-mo'
            , Twitter__c = 'https://twitter.com/sakuramiko35', FanNickname__c = '35P(みこぴー)'), 

            new Employee__c(Code__c = '000032', Name = '潤羽るしあ', Kana__c = 'うるはるしあ', HireDate__c = Date.newInstance(2019,6,16), Group__c = group3Gen.Id
            , YouTube__c = 'https://www.youtube.com/channel/UCl_gCybOJRIgOXw6Qb4qJzQ'
            , ImageURL__c = 'https://yt3.ggpht.com/a/AATXAJwi-Xs0ChOThMuUzFsl3cNZYgdP12Witb0cNSf9=s288-c-k-c0xffffffff-no-rj-mo'
            , Twitter__c = 'https://twitter.com/uruharushia', FanNickname__c = 'ふぁんでっど'),

            new Employee__c(Code__c = '000035', Name = '宝鐘マリソ', Kana__c = 'ほうしょうまりん', HireDate__c = Date.newInstance(2019,8,11), Group__c = group3Gen.Id
            , YouTube__c = 'https://www.youtube.com/channel/UCCzUftO8KOVkV4wQG1vkUvg'
            , ImageURL__c = 'https://yt3.ggpht.com/a/AATXAJwAAoZPNqrR0udm1KMznPYUUTbW-sERt_LZU-af=s288-c-k-c0xffffffff-no-rj-mo'
            , Twitter__c = 'https://twitter.com/houshoumarine', FanNickname__c = '宝鐘の一味')
      };
      insert employees;
        
    }

    @isTest 
    static void testMethod01() {
        Profile profile = getProfile('システム管理者');
        String uniqueUserName = 'RegisterEmployeeTest' + DateTime.now().getTime() + '@example.com';
        User u = registerUser(profile, uniqueUserName);
        System.runAs(u) {
    
            GetEmployeeDifferenceUsecase getEmployeeDifferenceUsecase = new GetEmployeeDifferenceUsecase();
            RegisterImportEmployeeUsecase registerImportEmployeeUsecase = new RegisterImportEmployeeUsecase();
    
            Test.startTest();
            // ユーザが画面から新しい社員情報を入力、salesforceに登録されている情報と比較した結果を返す。
            ImportEmployees importEmployees = createTestImportEmployeeData();
            EmployeeDifferences differences = getEmployeeDifferenceUsecase.execute(importEmployees);
            // ユーザが画面上で社員情報の比較結果を確認した後、入力した社員情報の登録を行う。
            differences = differences.excludeNoDifference();
            registerImportEmployeeUsecase.execute(differences);
            Test.stopTest();

            List<Employee__c> employees = [select Id, Code__c, Name from Employee__c order by Code__c];
            System.assertEquals(5, employees.size(), '社員数が一致していない');
        }

    }
    @isTest 
    static void testMethod02() {
        Profile profile = getProfile('システム管理者_設定・定義を参照するヌキ');
        String uniqueUserName = 'RegisterEmployeeTest' + DateTime.now().getTime() + '@example.com';
        User u = registerUser(profile, uniqueUserName);
        System.runAs(u) {

            GetEmployeeDifferenceUsecase getEmployeeDifferenceUsecase = new GetEmployeeDifferenceUsecase();
            RegisterImportEmployeeUsecase registerImportEmployeeUsecase = new RegisterImportEmployeeUsecase();
 
            Test.startTest();
            // ユーザが画面から新しい社員情報を入力、salesforceに登録されている情報と比較した結果を返す。
            ImportEmployees importEmployees = createTestImportEmployeeData();
            EmployeeDifferences differences = getEmployeeDifferenceUsecase.execute(importEmployees);
            // ユーザが画面上で社員情報の比較結果を確認した後、入力した社員情報の登録を行う。
            differences = differences.excludeNoDifference();
            registerImportEmployeeUsecase.execute(differences);
            Test.stopTest();

            List<Employee__c> employees = [select Id, Code__c, Name from Employee__c order by Code__c];
            System.assertEquals(5, employees.size(), '社員数が一致していない');
        }

    }

    private static ImportEmployees createTestImportEmployeeData() {

        List<ImportEmployee> employees = new List<ImportEmployee>{
            new ImportEmployee('兎田ぺこら', 'うさだぺこら', '000031', Date.newInstance(2019,7,17), null, '03'
                , 'https://yt3.ggpht.com/a/AATXAJwFs1D2-rT1XPz-fvlO5ZdnkKhPU-Uu6GDwNDn_FA=s288-c-k-c0xffffffff-no-rj-mo'
                , 'https://twitter.com/usadapekora', 'https://www.youtube.com/channel/UC1DCedRgGHBdm81E1llLhOQ', '野うさぎ同盟')
            , new ImportEmployee('潤羽るしあ', 'うるはるしあ', '000032', Date.newInstance(2019,6,16), null, '03'
                , 'https://yt3.ggpht.com/a/AATXAJwi-Xs0ChOThMuUzFsl3cNZYgdP12Witb0cNSf9=s288-c-k-c0xffffffff-no-rj-mo'
                , 'https://twitter.com/uruharushia', 'https://www.youtube.com/channel/UCl_gCybOJRIgOXw6Qb4qJzQ', 'ふぁんでっど')
            , new ImportEmployee('不知火フレア', 'しらぬいふれあ', '000033', Date.newInstance(2019,8,7), null, '03'
                , 'https://yt3.ggpht.com/a/AATXAJwGmRMcFMvE1JW3v152HnrXfMQxbI_Dw92KH0-CpA=s288-c-k-c0xffffffff-no-rj-mo'
                , 'https://twitter.com/shiranuiflare', 'https://www.youtube.com/channel/UCvInZx9h3jC2JzsIzoOebWg', 'エルフレンド')
            , new ImportEmployee('白銀ノエル', 'しろがねのえる', '000034', Date.newInstance(2019,8,8), null, '03'
                , 'https://yt3.ggpht.com/a/AATXAJyflKVfVjZg11sLPRv8BrLT-8ltdeRcTyKTWlXV=s288-c-k-c0xffffffff-no-rj-mo'
                , 'https://twitter.com/shiroganenoel', 'https://www.youtube.com/channel/UCdyqAaZDKHXg4Ahi7VENThQ', '白銀聖騎士団')
            , new ImportEmployee('宝鐘マリン', 'ほうしょうまりん', '000035', Date.newInstance(2019,8,11), null, '03'
                , 'https://yt3.ggpht.com/a/AATXAJwAAoZPNqrR0udm1KMznPYUUTbW-sERt_LZU-af=s288-c-k-c0xffffffff-no-rj-mo'
                , 'https://twitter.com/houshoumarine', 'https://www.youtube.com/channel/UCCzUftO8KOVkV4wQG1vkUvg', '宝鐘の一味')
        };
        return new ImportEmployees(employees);
    }

    private static Profile getProfile(String name) {
        return [select Id, Name from Profile where Name =: name limit 1];
    }

    private static User registerUser(Profile profile, String userName) {
        User u = new User(
            Alias = 'テスト太郎'
            , Email='daitubasa@example.com'
            , EmailEncodingKey='ISO-2022-JP'
            , LastName='Testing'
            , LanguageLocaleKey='ja'
            , LocaleSidKey='ja_JP'
            , TimeZoneSidKey='Asia/Tokyo'
            , ProfileId = profile.Id
            , UserName = userName
        );
        insert u;
        return u;
     }
}