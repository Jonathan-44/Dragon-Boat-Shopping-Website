class AddDiscountToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :discount, :decimal
  end
end
