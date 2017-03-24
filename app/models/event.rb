class Event < ActiveRecord::Base
  belongs_to :applicant_detail
  belongs_to :company

  validates :name, :interview_date, :test_date, presence: true

  def passed_interview?
  	return true if self.interview_results == "PASSED"
  end

  def failed_interview?
  	return true if self.interview_results == "FAILED"
  end

  def pending_interview?
    return true if self.interview_results  == "PENDING"
  end

  def sent_by_recruiter?
  	return true if self.sent_by == "Recruiter"
  	return false if self.sent_by == "Company" || nil
  end

  def confirm?
  	return true if self.confirm == "Confirmed"
  	return false if self.confirm == "Rejected"
  end
end
