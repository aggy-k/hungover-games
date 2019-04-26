class AddDefaultValueToGames < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :max_capacity, :integer, default: 28
    change_column :games, :attendees_count, :integer, default: 0
  end
end
