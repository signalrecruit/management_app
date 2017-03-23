class Event < ActiveRecord::Base
  belongs_to :applicant_detail

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
end
