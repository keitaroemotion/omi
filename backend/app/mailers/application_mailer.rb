class ApplicationMailer < ActionMailer::Base
  default from: "tobasojyo@gmail.com"
  layout 'mailer'

  def send_webhook(email_address)
    mail(to: email_address, subject: 'We got notification')
  end

  private

  def filter_webhook
  end
end
