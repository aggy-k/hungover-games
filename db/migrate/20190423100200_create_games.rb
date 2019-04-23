class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :timeslot, foreign_key: true
      t.date :date
      t.datetime :signup_time
      t.text :description
      t.text :announcement
      t.references :game_status, foreign_key: true
      t.string :location
      t.integer :max_capacity
      t.integer :attendees_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
