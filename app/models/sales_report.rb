# == Schema Information
#
# Table name: sales_reports
#
#  id         :bigint           not null, primary key
#  sold_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  boat_id    :bigint           not null
#  order_id   :bigint           not null
#  vendor_id  :bigint           not null
#
# Indexes
#
#  index_sales_reports_on_boat_id    (boat_id)
#  index_sales_reports_on_order_id   (order_id)
#  index_sales_reports_on_vendor_id  (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (boat_id => boats.id)
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (vendor_id => vendors.id)
#
class SalesReport < ApplicationRecord
  belongs_to :boat
  belongs_to :vendor
  belongs_to :order


  after_create :update_boat_status


  private


  def update_boat_status
    boat.update(cart_id: nil)  # Remove the boat from the cart
  end
 
end



