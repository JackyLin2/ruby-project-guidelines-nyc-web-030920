class CreateReservation < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :hotel_id 
      t.date :check_in
      t.date :check_out
      t.string :location
      t.float :price
    end
  end
end
