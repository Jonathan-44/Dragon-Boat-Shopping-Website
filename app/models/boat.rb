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
class Boat < ApplicationRecord
  before_save :apply_discount

  has_one_attached :image
  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than: 0 }


  attribute :sold, :boolean, default: false


  has_many :sales_reports, dependent: :destroy


  belongs_to(
    :cart,
    optional: true,
    class_name: 'Cart',
    foreign_key: 'cart_id',
    inverse_of: :boats
  )

  belongs_to(
    :vendor,
    class_name: 'Vendor',
    foreign_key: 'vendor_id',
    inverse_of: :boats
  )


  # Scope to filter available (unsold) boats
  scope :available, -> { where(sold: false) }


  # Scope to filter boats by vendor
  scope :for_vendor, ->(vendor) { where(vendor: vendor) }


    # Relationship with Reviews
    has_many :reviews, dependent: :destroy

    belongs_to :vendor

  def self.search(name_or_description_or_features_or_color_cont)
    if search_term.present?
      where("name LIKE ? :name_or_description_or_features_or_color_cont OR description LIKE :name_or_description_or_features_or_color_cont OR features LIKE :name_or_description_or_features_or_color_cont OR color LIKE :name_or_description_or_features_or_color_cont", name_or_description_or_features_or_color_cont: "%#{name_or_description_or_features_or_color_cont}%")
    else
      all
    end
  end
  def self.ransackable_attributes(auth_object = nil)
    ["name", "description", "price", "features", "color"]
  end


  #Attributese used for sorting feature
  def self.ransortable_attributes(auth_object = nil)
    ["name", "price", "features", "color"]
  end


  #Attributes used for filtering feature
  def self.ransackable_associations(auth_object = nil)
    ["name", "price", "features", "color"]
  end

  def apply_discount
    if discount.present? && discount > 0
      price - (price * (discount / 100))
    else
      price
    end
  end
  def discount_applied?
    discount.present? && discount > 0
  end

  def mark_as_sold
    update(sold: true)
  end


end

