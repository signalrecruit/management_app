class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :name, :phonenumber, :auth_code, presence: true
   validates :phonenumber, format: { with: /\A[-+]?[0-9]*\.?[0-9]+\Z/, message: "only allows numbers" }
end
