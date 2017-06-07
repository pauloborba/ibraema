require "rails_helper"

RSpec.describe BroadcastMailerMailer, type: :mailer do
  describe "broadcast_email" do
    let(:mail) { BroadcastMailerMailer.broadcast_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Broadcast email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
