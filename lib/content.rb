class Content
    
    def initialize(title,link,description)
        @title = title
        @link = link
        @description = description
    end
    
    attr_accessor :title, :link, :description

    def display
      puts "Title: #{@title}"
      puts "Link: #{@link}"
      puts "Description: #{@description}"
    end
    
end
