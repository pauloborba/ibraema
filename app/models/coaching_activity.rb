class CoachingActivity < ApplicationRecord
  belongs_to :institution
  has_one :institution
  has_many :facilitators
end
