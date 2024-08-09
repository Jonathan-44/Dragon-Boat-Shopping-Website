class AddShopperToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :shopper, null: false, foreign_key: true
  end
end
