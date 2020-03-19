class CreateHotel < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
    end
  end
end
