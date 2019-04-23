class CreateTimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      t.string :day
      t.time :start_time
      t.time :end
      t.datetime :default_signup_time

      t.timestamps
    end
  end
end
