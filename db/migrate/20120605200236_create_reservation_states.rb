class CreateReservationStates < ActiveRecord::Migration
  def change
    create_table :reservation_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
