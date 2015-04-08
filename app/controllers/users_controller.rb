class UsersController < ApplicationController
  def index
    #find all users?
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def starred
    @events = User.find(1).starred_events
  end
end
