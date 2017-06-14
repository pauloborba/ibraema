class User < ApplicationRecord
  has_many :donations
  
  def isDonor
    if(self.donations.count == 0 || !self.donations.last.isFromLastMonth)
      return false
    end
    
    return true
  end
  
  def isSponsor
    return self.isBronzeSponsor
  end
  
  def isBronzeSponsor
    return self.isDonor && (self.isSilverSponsor || self.donations.select{ |donation| donation.amount >= 100 }.count > 0)
  end
  
  def isSilverSponsor
    return self.isDonor && (self.isGoldSponsor || self.donations.select{ |donation| donation.amount >= 1000 }.count > 0)
  end
  
  def isGoldSponsor
    return self.isDonor && self.donations.select{ |donation| donation.amount >= 10000 }.count > 0
  end

end
