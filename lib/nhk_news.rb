require 'rss'
require 'content'
require 'custom_error'

class NHKNews
  def contents
    news = []

    # NHK(RSS 2.0)
    url = "http://www3.nhk.or.jp/rss/news/cat0.xml"

    begin
      rss = RSS::Parser.parse(url)

      rss.items.each do |item|
          content = Content.new(
              item.title,
              item.link,
              item.description
              )
          news.push(content.format)
      end

      news      
    rescue => exception
      raise(RSSLoadError,"rss contents load failed.")
    end

  end
end