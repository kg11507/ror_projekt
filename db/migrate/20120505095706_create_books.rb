class CreateBooks < ActiveRecord::Migration
  def self.up
    drop_table :books
  end
  
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id

      t.timestamps
    end
  end
end
