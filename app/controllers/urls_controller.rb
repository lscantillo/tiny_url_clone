class UrlsController < ApplicationController
  before_action :set_url_by_token, only:  %i[redirect go_to_redirect info]
  before_action :set_url, only: %i[ show ]

  def show
  end


  def redirect
    return render "shared/_404_alert" if @url.nil?
    @url.increment_with_sql!(:visit_count)
    @url.ips.create(ip: request.remote_ip)
    redirect_to @url.url
  end

  def go_to_redirect
    # return render "shared/_404_alert" if @url.nil?
    # @url.ips.create(ip: request.remote_ip)
    # @url.increment_with_sql!(:visit_count)
    # @url.ips.create(ip: request.remote_ip)
    # redirect_to @url.url
  end

  def info
    @visitors_ip = @url.ips
  end

  private

  def set_url
    @url = Url.find_by_token(params[:id])
  end

  def set_url_by_token
    @url = Url.find_by_token(params[:token])
  end

end
