class AddDateToAchievements < ActiveRecord::Migration[5.0]
  def change
    add_column :achievements, :date, :date
  end
end
