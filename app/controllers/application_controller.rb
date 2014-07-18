class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :admin?

  protected
  def admin?
    # return User.find(session[:user_id]).type == "Administrator"
    return @current_user.type == "Administrator"
  end

  def authenticate_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      return true
    else
      redirect_to(:controller => 'users', :action => 'login')
      return false
    end
  end

  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'users', :action => 'home')
      return false
    else
      return true
    end
  end

end
