class AddIsActiveToGameStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :game_statuses, :is_active, :boolean
  end
end
