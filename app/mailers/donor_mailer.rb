class DonorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.donor_mailer.thanks_email.subject
  #
  def thanks_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
