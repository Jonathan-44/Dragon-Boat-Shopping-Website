class AddCartFkColToBoats < ActiveRecord::Migration[7.0]
  def change
    add_reference :boats, :cart, foreign_key: true
  end
end
