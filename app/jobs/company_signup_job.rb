class CompanySignupJob < ActiveJob::Base
  queue_as :default

  def perform(company, secure_password, url)
    @company = company
    @url = url
    @secure_password = secure_password
    CompanySignupMailer.signup_company(@company, @secure_password, @url).deliver_later
  end
end
