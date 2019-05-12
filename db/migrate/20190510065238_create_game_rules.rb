class CreateGameRules < ActiveRecord::Migration[5.2]
  def change
    create_table :game_rules do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
