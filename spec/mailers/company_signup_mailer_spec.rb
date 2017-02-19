require "rails_helper"

RSpec.describe CompanySignupMailer, type: :mailer do
  describe "signup_company" do
    let(:mail) { CompanySignupMailer.signup_company }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup company")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
