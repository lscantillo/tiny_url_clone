class HomeController < ApplicationController
  before_action :url_params, only: [:create]
  

  def index
  end

  def create
    @url = params[:url]
    token = SecureRandom.hex(4)
    @tiny_token = Url.create(
      url: @url,
      token: token,
      domain: "#{ENV['HOSTNAME']}/#{token}"  
    )
    redirect_to url_path(token)
    
  end

  private

  def url_params
    params.permit(:url)
  end

end
