require 'bundler/setup'
require 'gmail'

class GMailer
  def initialize(args)
    @id = args[:id]
    @pass = args[:pass]
  end

  def send(args)
    gmail = Gmail.connect(@id,@pass)
    gmail.deliver do
      to args[:send_to]
      subject args[:subject]
      html_part do
        content_type 'text/html; charset=UTF-8'
        body args[:contents]
      end
    end

    gmail.logout
  end
end