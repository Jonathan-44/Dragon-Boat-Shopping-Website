# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  date        :datetime
#  description :text
#  location    :string
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  validates :name, :date, :location, :description, :url, presence: true
end
