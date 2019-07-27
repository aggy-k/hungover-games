class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :to_username
      t.string :from_username
      t.integer :create_time
      t.string :msg_type
      t.text :content
      t.integer :msg_id

      t.timestamps
    end
  end
end
