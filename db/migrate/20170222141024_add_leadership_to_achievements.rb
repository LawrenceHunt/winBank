class AddLeadershipToAchievements < ActiveRecord::Migration[5.0]
  def change
    add_column :achievements, :leadership, :boolean
  end
end
