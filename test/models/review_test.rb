# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  comment    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  boat_id    :bigint           not null
#  shopper_id :bigint           not null
#
# Indexes
#
#  index_reviews_on_boat_id     (boat_id)
#  index_reviews_on_shopper_id  (shopper_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#  fk_rails_...  (shopper_id => shoppers.id)
#
require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
