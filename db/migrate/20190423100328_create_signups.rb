class CreateSignups < ActiveRecord::Migration[5.2]
  def change
    create_table :signups do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.references :attendee_status, foreign_key: true

      t.timestamps
    end
  end
end
