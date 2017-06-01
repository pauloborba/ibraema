class UserMailer < ApplicationMailer
  default from: "ibraematestes@gmail.com"
 
  def welcome_email (user)
    @user = user
    mail to: user.email, subject: "Obrigado por nos ajudar a lutar contra o analfabetismo"
  end
end
