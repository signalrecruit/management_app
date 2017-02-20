require "rails_helper"

RSpec.describe CompanySignupMailer, type: :mailer do

  before do 
    @company = FactoryGirl.create :company

    def company_signup_mailer(company, secure_password, url)
      CompanySignupMailer.signup_company(company, secure_password, url)
    end

    @secure_password = SecureRandom.hex(5)
    @url = new_company_session_url(email: @company.email)
  end

  describe "signup_company" do
    let(:mail) { company_signup_mailer(@company, @secure_password, @url) }

    it "renders the headers" do
      expect(mail.subject).to eq("Dear #{@company.name}, you have been invited to try out recman")
      expect(mail.to).to eq([@company.email])
      expect(mail.from).to eq(["no-reply@recman.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
