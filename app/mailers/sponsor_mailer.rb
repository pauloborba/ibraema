class SponsorMailer < ApplicationMailer
  default from: "ibraematestes@gmail.com"
 
  def thanks_email (sponsor)
    @sponsor = sponsor

    attachments.inline['ibraema_logo.jpg'] = File.read('#{Rails.root}/app/assets/images/ibraema_logo.jpg')
    mail to: sponsor.email, subject: "Obrigado por nos ajudar a lutar contra o analfabetismo"
  end
end
