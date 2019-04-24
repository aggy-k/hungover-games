class RemoveEndFromTimeslots < ActiveRecord::Migration[5.2]
  def change
    remove_column :timeslots, :end, :time
    add_column :timeslots, :end_time, :datetime
  end
end
