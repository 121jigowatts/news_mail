require 'rss'
require 'content'

class NHKNews
  def contents
    news = []

    # NHK(RSS 2.0)
    url = "http://www3.nhk.or.jp/rss/news/cat0.xml"
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
  end
end