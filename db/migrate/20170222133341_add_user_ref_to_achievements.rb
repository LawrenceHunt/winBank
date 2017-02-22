class AddUserRefToAchievements < ActiveRecord::Migration[5.0]
  def change
    add_reference :achievements, :user, foreign_key: true
  end
end
