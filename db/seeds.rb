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