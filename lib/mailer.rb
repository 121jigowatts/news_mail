class Mailer
  attr_accessor :mail
  def initialize(mail)
    @mail = mail
  end

  def send(args)
    mail.send(args)
  end
end