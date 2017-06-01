# Preview all emails at http://localhost:3000/rails/mailers/email_mailer
class EmailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/email_mailer/send_new_email
  def send_new_email
    EmailMailerMailer.send_new_email
  end

end
