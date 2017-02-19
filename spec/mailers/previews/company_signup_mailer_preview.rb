# Preview all emails at http://localhost:3000/rails/mailers/company_signup_mailer
class CompanySignupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/company_signup_mailer/signup_company
  def signup_company
    CompanySignupMailer.signup_company
  end

end
