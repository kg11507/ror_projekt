class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :surname
      t.text :description

      t.timestamps
    end
  end
end
