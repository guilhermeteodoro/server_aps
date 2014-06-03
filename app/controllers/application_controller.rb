class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session


  private
  def require_signin!
    if current_user.nil?
      redirect_to signin_url, alert: "Você precisa se logar."
    end
  end
  helper_method :require_signin!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_signed_in?
    current_user ? true : false
  end
  helper_method :user_signed_in?

end