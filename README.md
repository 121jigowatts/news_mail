# News Mail
NHKよりRSS配信されたニュースをGmailアドレスに送信する。
ニュースは主要ニュースより取得している。

## 設定
config.rbファイルのADDRESS_BOOKにGmailアドレスを記述する。配列なので複数の宛先可。  
conf/application.env.templateをコピーしconf/application.envファイルを作成。送信者のGmailアドレスとパスワードを記述する。
PASSは二段階認証を設定し、アプリパスワードを生成すること。  
`GMAIL_ID="your mail address"`  
`GMAIL_PASS="your password"`  

.bash_profileにenvファイルをロードさせるための記述を追記。  
```
source {application path}/conf/application.env
```

## 実行
### 実行権限を付与する。  
`chmod +x bin/news_mail`

### cronで定期実行する。  

e.g. 毎日7,12,19時にメール配信する。  
`crontab -e`  
0 7,12,19 * * * /bin/bash -lc 'cd {application path}/bin && news_mail'

