class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name
      t.string :surname
      t.string :nickname
      t.integer :user_id
      t.timestamps
    end
  end
end
