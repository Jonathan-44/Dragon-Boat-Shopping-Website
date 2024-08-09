# == Schema Information
#
# Table name: placements
#
#  id             :bigint           not null, primary key
#  date           :date
#  participant    :string
#  position       :integer
#  race_name      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  dragon_race_id :bigint           not null
#
# Indexes
#
#  index_placements_on_dragon_race_id  (dragon_race_id)
#
# Foreign Keys
#
#  fk_rails_...  (dragon_race_id => dragon_races.id)
#
class Placement < ApplicationRecord
  belongs_to :dragon_race
end
