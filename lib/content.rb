class Content
  attr_accessor :title, :link, :description
  def initialize(title,link,description)
    @title = title
    @link = link
    @description = description
  end

  def display
    "Title: #{title} Link: #{link} Description: #{description}"
  end

  def format
    str = "<h3><a href='#{link}'>#{title}</a></h3>"
    str << "<p>#{description}</p>"

    str
  end
end