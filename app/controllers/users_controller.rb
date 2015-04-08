class UsersController < ApplicationController
  def index
    @events = User.find(1).starred_events
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
  end
end
