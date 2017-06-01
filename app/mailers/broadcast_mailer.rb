class BroadcastMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.broadcast_mailer.broadcast_email.subject
  #
  def broadcast_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
