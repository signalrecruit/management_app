class Skill < ActiveRecord::Base
  has_and_belongs_to_many :requirements
  has_and_belongs_to_many :applicant_details
  validates :name, :score, presence: true
end
