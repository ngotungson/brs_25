class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t ("app.logged_in")
      redirect_to login_url
    end
  end

  def logged_as_admin
    unless current_user && current_user.is_admin
      flash[:danger] = t "controllers.admin.login.flash.danger"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user.is_user? current_user
  end
end
