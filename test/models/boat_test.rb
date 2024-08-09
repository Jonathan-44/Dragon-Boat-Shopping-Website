# == Schema Information
#
# Table name: boats
#
#  id          :bigint           not null, primary key
#  color       :string
#  description :text
#  discount    :decimal(, )
#  features    :text
#  is_on_sale  :boolean
#  name        :string
#  price       :decimal(, )
#  sold        :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cart_id     :bigint
#  vendor_id   :bigint
#
# Indexes
#
#  index_boats_on_cart_id    (cart_id)
#  index_boats_on_vendor_id  (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (vendor_id => vendors.id)
#
require "test_helper"

class BoatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
