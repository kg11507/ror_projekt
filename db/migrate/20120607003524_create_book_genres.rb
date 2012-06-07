class CreateBookGenres < ActiveRecord::Migration
  def change
    create_table :book_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
