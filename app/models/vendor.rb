# == Schema Information
#
# Table name: vendors
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
#  index_vendors_on_email                 (email) UNIQUE
#  index_vendors_on_reset_password_token  (reset_password_token) UNIQUE
#
class Vendor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many(
    :boats,
    class_name: 'Boat',
    foreign_key: 'vendor_id',
    inverse_of: :vendor,
    dependent: :destroy
  )


  has_many :sales_reports, dependent: :destroy


end

