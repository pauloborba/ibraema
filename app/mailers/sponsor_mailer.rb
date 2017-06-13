class SponsorMailer < ApplicationMailer
  default from: "ibraematestes@gmail.com"
 
  def thanks_email (sponsor)
    @sponsor = sponsor
    
    @sponsor_type = ""
    if @sponsor.isGoldSponsor
      @sponsor_type = "Gold"
    elsif @sponsor.isSilverSponsor 
      @sponsor_type = "Silver"
    else 
      @sponsor_type = "Bronze"
    end

    attachments.inline['ibraema_logo.jpg'] = File.read('app/assets/images/ibraema_logo.jpg')
    mail to: sponsor.email, subject: "Obrigado por nos ajudar a lutar contra o analfabetismo"
  end
end
