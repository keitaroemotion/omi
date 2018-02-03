class InterfaceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def take
    archive    
    send_email
    send_slack
  end

  private

  def send_email
  end

  def send_slack
  end

  def archive
    File.open(".history", "a") do |f|
      f.puts params.to_s
    end
  end
end
