@isTest
private class RegisterEmployeeTest2 {

    @isTest 
    static void testController01() {
        Profile profile = getProfile('システム管理者');
        String uniqueUserName = 'RegisterEmployeeTest' + DateTime.now().getTime() + '@example.com';
        User u = registerUser(profile, uniqueUserName);
        System.runAs(u) {
            ApexTestResultListController con = new ApexTestResultListController();
            System.assertNotEquals(null, con.testResults, 'ApexTestResultの取得に失敗');
        }
    }
    @isTest 
    static void testController02() {
        Profile profile = getProfile('システム管理者_設定・定義を参照するヌキ');
        String uniqueUserName = 'RegisterEmployeeTest' + DateTime.now().getTime() + '@example.com';
        User u = registerUser(profile, uniqueUserName);
        System.runAs(u) {
            ApexTestResultListController con = new ApexTestResultListController();
            System.assertNotEquals(null, con.testResults, 'ApexTestResultの取得に失敗');
        }
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
