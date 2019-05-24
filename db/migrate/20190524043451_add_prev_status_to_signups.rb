class AddPrevStatusToSignups < ActiveRecord::Migration[5.2]
  def change
    add_column :signups, :previous_status, :string
  end
end
