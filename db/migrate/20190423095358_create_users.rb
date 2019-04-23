class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :wechat_id
      t.string :username
      t.string :profile_image
      t.string :first_name
      t.string :last_name
      t.string :type

      t.timestamps
    end
  end
end
