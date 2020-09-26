# 概要
この記事はSalesforce 開発者向けブログ投稿キャンペーンへのエントリー記事です。  
  
Salesforce 開発者向けブログ投稿キャンペーン 第3弾 開催のお知らせ
https://developer.salesforce.com/jpblogs/2020/08/salesforce-developers-blog-3rd/

Summer' 20 リリースノートの「Apex テストデータにアクセスする場合の「設定を参照」権限の必須化」の動作を確認します。  
https://releasenotes.docs.salesforce.com/ja-jp/summer20/release-notes/rn_apex_ViewSetupReq_ApexTestObjects.htm

下記のビジネスユースケースを用意し、対応するテストコードを書いて検証します。  
ビジネスユースケース(社員情報の更新処理)：  
・ユーザは、画面から新しい社員情報を入力します。  
　salesforce は、入力された社員情報と社員コードが一致する登録済みの情報を取得し比較した結果を返します。  
・ユーザは比較した結果を確認した後、入力した社員情報の登録を行います。  
　saleforce は比較結果を元に社員情報の登録 or 更新 or 削除を行います。  
　
