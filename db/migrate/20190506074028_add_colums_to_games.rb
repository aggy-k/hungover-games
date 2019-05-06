class AddColumsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :total_headcount, :integer, default: 0
    add_column :games, :waitlist_count, :integer, default: 0
  end
end
