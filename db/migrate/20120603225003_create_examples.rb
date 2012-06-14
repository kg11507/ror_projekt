class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :book_id
      t.integer :publisher_id
      t.date :publish_date
      t.date :buy_date
      t.text :description

      t.timestamps
    end
  end
end
