class Requirement < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :qualifications
  has_one :compulsory_requirement, dependent: :destroy

  validates :title, :job_type, :location, :experience, :min_salary, :max_salary,
  		:number_of_vacancies, :company_id, presence: true 
  
  attr_accessor :qualification_names, :skill_names
  
  def qualification_names=(names)
    @qualification_names = names

    @qualification_names.split(', ').each do |name|
      self.qualifications << Qualification.find_or_initialize_by(name: name, score: 10)  
    end
  end    

  def skill_names=(names)
    @skill_names = names

    @skill_names.split(', ').each do |name|
      self.skills << Skill.find_or_initialize_by(name: name, score: 10)
    end
  end

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

