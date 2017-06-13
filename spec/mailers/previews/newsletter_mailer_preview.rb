# Preview all emails at http://localhost:3000/rails/mailers/newsletter_mailer
class NewsletterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/newsletter_mailer/article_email
  def article_email
    NewsletterMailerMailer.article_email
  end

end
