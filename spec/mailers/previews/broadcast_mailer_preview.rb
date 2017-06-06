# Preview all emails at http://localhost:3000/rails/mailers/broadcast_mailer
class BroadcastMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/broadcast_mailer/broadcast_email
  def broadcast_email
    BroadcastMailerMailer.broadcast_email
  end

end
