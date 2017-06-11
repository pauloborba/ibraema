# Preview all emails at http://localhost:3000/rails/mailers/sponsor_mailer
class SponsorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sponsor_mailer/thanks_email
  def thanks_email
    SponsorMailerMailer.thanks_email
  end

end
