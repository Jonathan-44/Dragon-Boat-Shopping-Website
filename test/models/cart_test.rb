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
require "test_helper"

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
