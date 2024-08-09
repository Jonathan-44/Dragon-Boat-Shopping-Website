# == Schema Information
#
# Table name: orders
#
#  id                 :bigint           not null, primary key
#  address            :string
#  city               :string
#  country            :string
#  credit_card_number :string
#  cvv                :string
#  email              :string
#  expiration_date    :string
#  name               :string
#  state              :string
#  zip                :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  cart_id            :bigint           not null
#  shopper_id         :bigint
#
# Indexes
#
#  index_orders_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
