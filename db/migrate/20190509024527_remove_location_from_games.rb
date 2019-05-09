class RemoveLocationFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :location, :string
  end
end
