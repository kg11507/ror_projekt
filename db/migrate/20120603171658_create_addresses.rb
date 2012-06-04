class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.string :house_nr
      t.string :local_nr
      t.string :postal_code

      t.timestamps
    end
  end
end
