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
class Review < ApplicationRecord
  belongs_to :boat
  belongs_to :shopper  # Ensure this is included to associate reviews with shoppers
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true
end
