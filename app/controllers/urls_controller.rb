class UrlsController < ApplicationController
  before_action :set_url_by_token, only:  %i[redirect go_to_redirect info]
  before_action :set_url, only: %i[ show ]

  def show
  end


  def redirect
    return render "shared/_404_alert" if @url.nil? # Show error page when token is not valid
    @url.increment_with_sql!(:visit_count) ## Method to increment via sql column visit count
    @url.ips.create(ip: request.remote_ip) ## Save client ip to url
    redirect_to @url.url
  end

  # TODO Fix double rendering in redirect button
  def go_to_redirect
    # return render "shared/_404_alert" if @url.nil?
    # @url.ips.create(ip: request.remote_ip)
    # @url.increment_with_sql!(:visit_count)
    # @url.ips.create(ip: request.remote_ip)
    # redirect_to @url.url
  end

  # Show visitors in url
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
