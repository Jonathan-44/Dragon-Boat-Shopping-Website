# == Schema Information
#
# Table name: shoppers
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_shoppers_on_email                 (email) UNIQUE
#  index_shoppers_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class ShopperTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
