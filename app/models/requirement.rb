class Requirement < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :qualifications
  has_one :compulsory_requirement, dependent: :destroy

  validates :title, :job_type, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :company_id, :qualification_ids, :skill_ids, presence: true 

  def send_requirements
    self.update(sent: Time.now )
  end

  def requirements_sent?
  	if sent.nil?
  	  false
  	else
  	  true
  	end
  end

  def self.only_sent_requirements
    Requirement.where('sent IS NOT NULL')
  end
end

