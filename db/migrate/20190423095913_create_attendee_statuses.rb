class CreateAttendeeStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :attendee_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
