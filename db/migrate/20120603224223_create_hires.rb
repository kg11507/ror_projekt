class CreateHires < ActiveRecord::Migration
  def change
    create_table :hires do |t|
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
