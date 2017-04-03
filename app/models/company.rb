class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :requirements, dependent: :destroy
  has_many :events, dependent: :destroy    
  has_many :employees, dependent: :destroy
  has_many :applicant_details, dependent: :destroy
  
  # validates :name, :phonenumber, :auth_code, presence: true
  validates :phonenumber, format: { with: /\A[-+]?[0-9]*\.?[0-9]+\Z/, message: "only allows numbers" }, allow_blank: true
end
