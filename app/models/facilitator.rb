class Facilitator < ApplicationRecord
  belongs_to :institution
  has_one :coaching_activity, through: :institution
end
