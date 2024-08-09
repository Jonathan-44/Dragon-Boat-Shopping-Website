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
class Order < ApplicationRecord
  belongs_to :shopper
  belongs_to :cart
  validates :name, :email, :address, :city, :state, :zip, :country, :cart_id, presence: true


  has_many :sales_reports


  after_create :generate_sales_report


  private


  def generate_sales_report
    cart.boats.each do |boat|
      SalesReport.create!(boat: boat, vendor: boat.vendor, order: self, sold_at: Time.current)
      boat.mark_as_sold # Mark the boat as sold
    end
  end
end


