class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @achievements = @user.achievements
    @counts = themes_count(@achievements)
  end

  private

  def themes_count(achievements_array)
    counts = {leadership: 0, efficiency: 0}
    achievements_array.each do |achievement|
      counts[:leadership] += 1 if achievement.leadership
      counts[:efficiency] += 1 if achievement.efficiency
    end
    counts
  end

end
