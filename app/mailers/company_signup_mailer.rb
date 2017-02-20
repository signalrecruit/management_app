class CompanySignupMailer < ApplicationMailer
  default from: "recman.com"
  
  def signup_company(company, secure_password, url)
    @company = company
    @email = @company.email
    @url = url
    @secure_password = secure_password

    mail(to: @email, subject: "Dear #{@company.name}, you have been invited to try out recman")
  end
end
