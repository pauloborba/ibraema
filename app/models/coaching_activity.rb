class CoachingActivity < ApplicationRecord
    start_date :date
    finish_date :date

    has_many :facilitators, dependent: :destroy
    has_one :institution, dependent: :destroy
end
