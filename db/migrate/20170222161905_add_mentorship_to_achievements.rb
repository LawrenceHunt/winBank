class AddMentorshipToAchievements < ActiveRecord::Migration[5.0]
  def change
    add_column :achievements, :mentorship, :boolean
  end
end
