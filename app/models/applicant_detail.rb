class ApplicantDetail < ActiveRecord::Base
  belongs_to :requirement
  has_many :experiences, dependent: :destroy
  has_one :score, dependent: :destroy
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :qualifications
  has_and_belongs_to_many :job_types

  mount_uploader :attachment, AttachmentUploader
  
  validates :name, :email, :phonenumber, :location, :experience, :min_salary,
  :max_salary, :job_title, presence: true
  
  
  attr_accessor :qualification_names, :skill_names, :job_type_names
  
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

  def job_type_names=(names)
    @job_type_names = names 

    @job_type_names.split(', ').each do |name|
      self.job_types << JobType.find_or_initialize_by(name: name)
    end
  end

end
