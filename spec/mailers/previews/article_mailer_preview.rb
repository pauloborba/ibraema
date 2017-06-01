# Preview all emails at http://localhost:3000/rails/mailers/article_mailer
class ArticleMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/article_mailer/article_email
  def article_email
    ArticleMailerMailer.article_email
  end

end
