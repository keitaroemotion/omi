class InterfaceController < ApplicationController
  skip_before_action :verify_authenticity_token

  require 'mail'
  require 'io/console'

  def index
  end

  def take
    archive    
    send_email
    send_slack
  end

  private

  def send_slack
  end

  def archive
    File.open(".history", "a") do |f|
      f.puts params.to_s
    end
  end

  def send_email
    sender_email_address = Rails.application.secrets.sender_email_address
    target_addresses     = Rails.application.secrets.default_target_addresses.split(",")
    pass                 = Rails.application.secrets.email_pass
    user_name            = /^[^@]+/.match(sender_email_address).to_s
  
    Mail.defaults do
      delivery_method :smtp, {
        address:              "smtp.gmail.com",
        port:                 587,
        domain:               "example.com", # this does not need to be changed
        user_name:            user_name,
        password:             pass,
        authentication:       'plain',
        enable_starttls_auto: true
      }
    end

    target_addresses.each do |recipient_email_address| 
      mail = build_mail(sender_email_address, recipient_email_address, "This is a Test", "This is a body")
      mail.charset = "UTF-8"
      mail.content_transfer_encoding = "8bit"
      mail.deliver!
    end

  rescue Net::SMTPAuthenticationError
    raise("\nEmailAddress/Password is incorrect: #{sender_email_address}\n\n")
  end  
  
  def build_mail(sender_email_address, recipient_email_address, _subject, _body)
    Mail.new do
      from    sender_email_address
      to      recipient_email_address 
      subject _subject
      body    _body
    end  
  end
end
