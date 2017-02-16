class Request < ActiveRecord::Base
  
  validates :fullname, :phonenumber, :email, :company, :job_title, presence: true
  validates :phonenumber, format: { with: /\A[-+]?[0-9]*\.?[0-9]+\Z/, message: "only allows numbers" }
  validates_format_of :email,:with => Devise::email_regexp


  def contact
  	self.update(contacted: true)
  end

  def no_contact
  	self.update(contacted: false)
  end
end
