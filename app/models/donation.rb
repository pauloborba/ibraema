class Donation < ApplicationRecord
  belongs_to :user

  def isFromLastMonth
    return (DateTime.now - self.donation_date.to_date).to_i <= 30
  end

end
