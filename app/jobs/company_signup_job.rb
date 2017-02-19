class CompanySignupJob < ActiveJob::Base
  queue_as :default

  def perform(company, url)
    @company = company
    @url = url
    CompanySignupMailer.signup_company(@company, @url).deliver_later
  end
end
