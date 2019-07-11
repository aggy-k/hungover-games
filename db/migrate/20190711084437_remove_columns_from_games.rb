class RemoveColumnsFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :total_headcount, :integer
    remove_column :games, :waitlist_count, :integer
    remove_column :games, :attendees_count, :integer
  end
end
