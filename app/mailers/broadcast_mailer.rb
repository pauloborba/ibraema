class BroadcastMailer < ApplicationMailer
   default from: "ibraematestes@gmail.com"
  
  def broadcast_email(email)
    @email = email
    donor_users = User.all.select{ |user| user.isDonor }
    user_emails = donor_users.collect(&:email).join(",")
   
    mail to: user_emails, subject: "Nova Notícia: " + email.subject
  end
end
