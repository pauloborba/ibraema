class ArticleMailer < ApplicationMailer
  default from: "ibraematestes@gmail.com"
 
  def article_email(article)
    @article = article

    all_users = User.all
    user_emails = all_users.collect(&:email).join(",")
   
    mail to: user_emails, subject: "Novo Artigo: " + article.title
    
  end
end
