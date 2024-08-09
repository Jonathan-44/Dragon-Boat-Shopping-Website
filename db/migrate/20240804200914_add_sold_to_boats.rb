class AddSoldToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :sold, :boolean, default: false
  end
end
