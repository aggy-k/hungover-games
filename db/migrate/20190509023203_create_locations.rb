class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.float :long
      t.float :lat

      t.timestamps
    end
  end
end
