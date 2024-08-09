class AddShopperIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :shopper_id, :bigint
  end
end
