class CreateGameStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :game_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
