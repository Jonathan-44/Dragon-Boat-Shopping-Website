class AddVendorFkColToBoats < ActiveRecord::Migration[7.0]
  def change
    add_reference :boats, :vendor, foreign_key: true
  end
end
