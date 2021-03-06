require 'instagram'

class InstaOauthController < ApplicationController
  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    session[:access_token] = response.access_token
    redirect_to root_path
  end

  def disconnect
    session[:access_token] = nil
    redirect_to root_path
  end

end
