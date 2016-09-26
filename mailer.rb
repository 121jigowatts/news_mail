require 'gmail'

class Mailer

  def initialize(id,pass)
    @id = id
    @pass = pass
  end

  def send(send_to,subject,contents)
    gmail = Gmail.connect(@id,@pass)
    gmail.deliver do
      to send_to
      subject subject
      html_part do
        content_type 'text/html; charset=UTF-8'
        body contents
      end
    end

    gmail.logout
  end

end