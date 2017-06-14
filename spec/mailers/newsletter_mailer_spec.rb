require "rails_helper"

RSpec.describe NewsletterMailerMailer, type: :mailer do
  describe "article_email" do
    let(:mail) { NewsletterMailerMailer.article_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Article email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
