class InterfaceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def take
    archive    
  end

  private

  def archive
    File.open(".history", "a") do |f|
      f.puts params.to_s
    end
  end
end
