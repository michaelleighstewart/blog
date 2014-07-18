class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt, :new, :create]
  
def blogs
  end

  def home
  end

  def index
  end

  def login

  end
  
  def login_attempt
    authorized_user = User.authenticate(params[:username], params[:login_password])
    if authorized_user
      # flash[:notice] = "Welcome again, you logged in as #{authorized_user.username}"
      session[:user_id] = authorized_user.id
      redirect_to(:action => 'home')
    else
      # flash[:notice] = "Invalid username or password"
      render "login"
    end
  end

  def create
    @user = User.new(user_params)
    if(@user.save)
      flash[:notice] = "Signed up successfully"
    else
      flash[:notice] = "Error in signup"
    end
    render "new"
  end

  def new
    @user = User.new
  end

  def show
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :encrypted_password, :salt, :type)
  end
end
