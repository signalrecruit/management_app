class ApplicantDetail < ActiveRecord::Base
  belongs_to :requirement
  has_many :experiences
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :qualifications

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

end
