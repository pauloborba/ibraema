class NewsletterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.article_email.subject
  #
  def article_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
