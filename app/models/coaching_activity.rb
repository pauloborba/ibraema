class CoachingActivity < ApplicationRecord
  belongs_to :institution
  has_and_belongs_to_many :facilitators
end
