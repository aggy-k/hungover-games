class AddPrivateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :is_private, :boolean, default: false
  end
end
