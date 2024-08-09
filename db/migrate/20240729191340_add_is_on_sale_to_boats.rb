class AddIsOnSaleToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :is_on_sale, :boolean
  end
end
