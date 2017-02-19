class CompanySignupJob < ActiveJob::Base
  queue_as :default

  def perform(company, url)
    @company = company
    @url = url
    CompanySignupMailer.company_signup_mailer(@company, @url).deliver_later
  end
end
