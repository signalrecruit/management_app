class CompanySignupMailer < ApplicationMailer
  default from: "recman.com"
  
  def signup_company(company, url)
    @company = company
    @email = @company.email
    @url = url

    mail(to: @email, subject: "Dear #{@company.fullname}, you have been invited to try out recman")
  end
end
