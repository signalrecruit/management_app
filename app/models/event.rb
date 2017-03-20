class Event < ActiveRecord::Base
  belongs_to :applicant_detail

  validates :name, presence: true
end
