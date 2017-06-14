class DonorMailer < ApplicationMailer
  default from: "ibraematestes@gmail.com"
 
  def thanks_email (donor)
    @donor = donor
    mail to: donor.email, subject: "Obrigado por nos ajudar a lutar contra o analfabetismo"
  end
end
