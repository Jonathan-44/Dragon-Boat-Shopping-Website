class CreateSalesReports < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_reports do |t|
      t.references :boat, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.datetime :sold_at

      t.timestamps
    end
  end
end
