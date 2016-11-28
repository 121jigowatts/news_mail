require 'custom_error'

class News
  attr_accessor :rss, :logger
  def initialize(rss,logger)
    @rss = rss
    @logger = logger
  end

  def get_contents(t)
    begin
      format(rss.contents,t)
    rescue RSSLoadError => e
      logger.error("Load failed: #{e}")
      raise
    end
  end

  private  
  def format(contents,t)
    str = "<h1>#{time_format(t)}</h1>"
    str << contents.join

    str
  end

  def time_format(t)
    t.strftime("%Y-%m-%d #{wday_jp(t.wday)}曜日 %H:%M")
  end

  def wday_jp(n)
    %w(日 月 火 水 木 金 土)[n]
  end
end
