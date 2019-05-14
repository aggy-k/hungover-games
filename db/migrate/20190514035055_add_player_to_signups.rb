class AddPlayerToSignups < ActiveRecord::Migration[5.2]
  def change
    add_column :signups, :player, :string
  end
end
