class Institution < ApplicationRecord
    has_many :facilitators
    has_many :coaching_activity
end
