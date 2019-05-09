class AddLocationToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :location, foreign_key: true
  end
end
