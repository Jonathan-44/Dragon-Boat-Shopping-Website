# == Schema Information
#
# Table name: dragon_races
#
#  id         :bigint           not null, primary key
#  date       :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DragonRace < ApplicationRecord
  has_many :placements, dependent: :destroy
  validates :name, presence: true
  validates :date, presence: true
end
