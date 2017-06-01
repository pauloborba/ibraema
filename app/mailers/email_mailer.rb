class EmailMailer < ApplicationMailer
  default from: "ibraematestes@gmail.com"
  
  
  def send_new_email(email)
    @email = email
    all_users = User.all
    user_emails = all_users.collect(&:email).join(",")
   
    mail to: user_emails, subject: "Nova Notícia: " + email.subject
  end
end