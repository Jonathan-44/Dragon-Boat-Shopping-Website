class AddFeaturesToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :features, :text
  end
end
