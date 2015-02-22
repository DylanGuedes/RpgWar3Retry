class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include RpgHelper
  include ApplicationHelper

  private
  def admin_filter
    unless signed_in? && current_user.admin
      flash[:notice] = "You are not an admin!"
      redirect_to root_path            
    end
  end

  def signin_filter
    unless signed_in?
      flash[:error] = "You are not logged."
      redirect_to signin_path
    end
  end
end
