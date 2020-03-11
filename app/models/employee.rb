class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :applicant_detail
  
  has_many :educational_qualifications, dependent: :destroy
  has_many :employment_histories, dependent: :destroy
  has_many :next_of_kins, dependent: :destroy
  has_many :parent_details, dependent: :destroy
  has_many :children_details, dependent: :destroy
  has_one :spouse_detail, dependent: :destroy
  has_one :salary_detail, dependent: :destroy


  def is_profile_complete?
    educational_qualifications.empty? || employment_histories.empty? || next_of_kins.empty?  ||
      parent_details.empty? ||children_details.empty? || spouse_detail.nil? || salary_detail.nil?
  end
end
