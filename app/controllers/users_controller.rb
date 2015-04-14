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
    edit_params = params.require(:user).permit(:email, :username, :company, :site, :avatar)
    @user = User.find_by_username(params[:username])
    if @user.update(edit_params)
      redirect_to user_path(@user.username), notice: "Profile updated successfully"
    else
      flash.now[:notice] = "Please fix the following errors:"
      render :edit
  end

  def destroy
    User.delete(current_user.id)
    redirect_to login_path, notice: "Your account has been deleted"
  end

  def starred
    @events = User.find_by_username(params[:username]).starred_events
  end
end
