# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Recruiter.create(email: "user@recruiter.com", password: "password", password_confirmation: "password")
Company.create(email: "user@company.com", password: "password", password_confirmation: "password",
 phonenumber: "0204704427", name: "BioGen", auth_code: Devise.friendly_token)

array_of_skills = ["management", "accounting", "programming", "research", "analysis", "management", "book/record keeping", "technical drawing"]
array_of_skills.each do |skill|
  Skill.create(name: skill, score: 10)
end

educational_requirements = ["BSc", "MSc", "PhD", "diploma", "MPhil"]
educational_requirements.each do |educational_requirement|
  Qualification.create(name: educational_requirement, score: 10)
end

job_types = ["research", "research and diagnositics", "accounting", "software development", "web development",
"software architecture", "secretary"]
job_types.each do |job_type|
  JobType.create(name: job_type)
end