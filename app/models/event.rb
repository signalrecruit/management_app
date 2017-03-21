class Event < ActiveRecord::Base
  belongs_to :applicant_detail

  validates :name, :interview_date, :test_date, presence: true
end
