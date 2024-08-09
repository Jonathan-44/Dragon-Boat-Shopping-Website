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
class Shopper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders
  has_many :reviews, dependent: :destroy   # Ensures reviews are removed if shopper is deleted
  after_create :create_cart

  private

  def create_cart
    create_cart!
  end

end
