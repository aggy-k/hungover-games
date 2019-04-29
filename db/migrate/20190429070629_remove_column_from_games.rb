class RemoveColumnFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_reference :games, :timeslot, foreign_key: true
  end
end
