class CreateHires < ActiveRecord::Migration
  def change
    create_table :hires do |t|
      t.integer :example_id
      t.integer :user_id
      t.datetime :return_date
      
      t.timestamps
    end
  end
end
