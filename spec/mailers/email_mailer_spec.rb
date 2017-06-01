require "rails_helper"

RSpec.describe EmailMailerMailer, type: :mailer do
  describe "send_new_email" do
    let(:mail) { EmailMailerMailer.send_new_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Send new email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
