# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shopper_id :bigint           not null
#
# Indexes
#
#  index_carts_on_shopper_id  (shopper_id)
#
# Foreign Keys
#
#  fk_rails_...  (shopper_id => shoppers.id)
#
class Cart < ApplicationRecord
  belongs_to :shopper

  has_many :boats, dependent: :destroy

  # Calculate the total price of all boats in the cart
  def total_price
    boats.sum do |boat|
      if boat.discount.present? && boat.discount > 0
        boat.price - (boat.price * (boat.discount / 100.0))
      else
        boat.price
      end
    end
  end

  # Method to remove all boats from the cart
  def destroy_all_items
    boats.update_all(cart_id: nil)
  end
end
