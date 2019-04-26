class AddTimeslotToGames < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :timeslot, foreign_key: true
  end
end
