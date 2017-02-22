class AchievementsController < ApplicationController

  def index

  end

  def new
    @user = current_user
    @achievement = Achievement.new
  end

  def create
    @user = current_user
    @achievement = @user.achievements.new(achievements_params)
    if @achievement.save
      redirect_to "/users/#{@user.id}"
    else
      render 'new'
    end
  end

  private

  def achievements_params
    params.require(:achievement).permit(:description, :date, :leadership, :efficiency, :mentorship)
  end

end
