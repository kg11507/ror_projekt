class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :example_id
      t.integer :user_id
      t.integer :hire_id
      t.boolean :canceled
      t.timestamps
    end
  end
end
