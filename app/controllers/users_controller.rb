class UsersController < ApplicationController
  def index
    #find all users?
  end

  def show
    #show profile and events created by user
    @user = User.find_by_username(:username)
    @events = @user.events
  end

  def new
  end

  def create
    req_params = params.require(:user).permit(:username, :password, :password_confirmation, :email)
    user = User.new(req_params)
    if user.save
      redirect_to edit_user_path(user.username)
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find_by_username(params[:username])
  end

  def update
  end

  def destroy
  end

  def starred
    @events = User.find_by_username(params[:username]).starred_events
  end
end
