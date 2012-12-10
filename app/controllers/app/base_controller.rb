# encoding: UTF-8

class App::BaseController < ApplicationController
  layout 'app'

  helper_method :current_user
  before_filter :require_user

  protected  
  def require_user
    return true if current_user
    redirect_to "/app/login?rd=#{env['PATH_INFO']}"
  end

  def current_user
    return @current_user if defined?(@current_user)
    return (@current_user = nil) if session[:user_id].blank?
    @current_user = User.where("id = ?", session[:user_id]).first
  end
end