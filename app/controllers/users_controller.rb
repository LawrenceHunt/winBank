class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @achievements = @user.achievements
  end
end
