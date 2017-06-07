# Preview all emails at http://localhost:3000/rails/mailers/donor_mailer
class DonorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/donor_mailer/thanks_email
  def thanks_email
    DonorMailerMailer.thanks_email
  end

end
