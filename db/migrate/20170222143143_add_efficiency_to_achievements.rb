class AddEfficiencyToAchievements < ActiveRecord::Migration[5.0]
  def change
    add_column :achievements, :efficiency, :boolean
  end
end
