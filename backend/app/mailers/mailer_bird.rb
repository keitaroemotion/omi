class MailerBird < ApplicationMailer
  default from: "tobasojyo@gmail.com"
  def send_webhook(email_address)
    mail(to: email_address, subject: 'We got notification')
  end

  private

  def filter_webhook
  end
end
