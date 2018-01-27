class PaymentController < ApplicationController
  def index
    MailerBird.send_webhook("kei@omise.co").deliver
    MailerBird.send_webhook("tobasojyo@gmail.com").deliver
  end
end
