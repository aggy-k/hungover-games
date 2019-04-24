class ChangeStartTimeToDatetimeInTimeslots < ActiveRecord::Migration[5.2]
  def change
    remove_column :timeslots, :start_time, :time
    add_column :timeslots, :start_time, :datetime
  end
end
