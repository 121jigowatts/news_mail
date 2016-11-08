# News Mail
NHKよりRSS配信されたニュースをGmailアドレスに送信する。
ニュースは主要ニュースより取得している。

## 設定
config.rbファイルのADDRESS_BOOKにGmailアドレスを記述する。配列なので複数の宛先可。
送信者のGmailアドレスとパスワードを環境変数に記述する。PASSは二段階認証を設定し、アプリパスワードを生成すること。  
`GMAIL_ID="your mail address"`  
`GMAIL_PASS="your password"`  

## 実行
cronで定期実行する。  

e.g. 毎日7,12,19時にメール配信する。  
`crontab -e`  
0 7,12,19 * * * /bin/bash -lc 'cd /home/user/bin/news_mail && ruby main.rb'

