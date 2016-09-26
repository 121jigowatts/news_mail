require 'rss'

require './content'

class News

  def get_contents
    @news = []

    # NHK(RSS 2.0)
    url = "http://www3.nhk.or.jp/rss/news/cat0.xml"
    rss = RSS::Parser.parse(url)

    rss.items.each do |item|
        content = Content.new(
            item.title,
            item.link,
            item.description
            )
        @news.push(content)
    end

    format
  end

  private  
  def format
    str = "<h1>#{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}</h1>"

    @news.each do |content|
      str << "<a href='#{content.link}'>#{content.title}</a>"
      str << "<p>#{content.description}</p>"
    end

    str
  end

end
