class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :price
  end
end
