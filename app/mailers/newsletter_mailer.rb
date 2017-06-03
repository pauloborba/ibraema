class NewsletterMailer < ApplicationMailer
  
  default from: "ibraematestes@gmail.com"
 
  def article_email(article)
    @article = article

    donor_users = User.all.select{ |user| user.isDonor }
    user_emails = donor_users.collect(&:email).join(",")
   
    mail to: user_emails, subject: "Nova Notícia: " + article.title
  end
end
