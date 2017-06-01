class Facilitator < ApplicationRecord
  belongs_to :institution
  has_one :coaching_activity
  belongs_to :coaching_activity, optional: true
end
