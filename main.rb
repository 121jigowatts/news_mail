require './news'
require './mailer'
require './config'

# コンテンツ取得
news = News.new
contents = news.get_contents

# メール送信
mailer = Mailer.new(ID,PASS)

ADDRESS_BOOK.each do |address|
  mailer.send(address,SUBJECT,contents)
end