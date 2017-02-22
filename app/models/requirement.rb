class Requirement < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :qualifications

  validates :title, :job_type, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :company_id, :qualification_ids, :skill_ids, presence: true 
end

