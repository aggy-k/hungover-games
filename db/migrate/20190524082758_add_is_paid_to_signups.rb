class AddIsPaidToSignups < ActiveRecord::Migration[5.2]
  def change
    add_column :signups, :is_paid, :boolean, default: false
  end
end
