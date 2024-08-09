class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :credit_card_number
      t.string :expiration_date
      t.string :cvv
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
