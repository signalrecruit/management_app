class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :applicant_detail
  
  has_many :educational_qualifications, dependent: :destroy
  accepts_nested_attributes_for :educational_qualifications, reject_if: :all_blank

  has_many :employee_histories, dependent: :destroy
  accepts_nested_attributes_for :employee_histories, reject_if: :all_blank

  has_many :next_of_kins, dependent: :destroy
  accepts_nested_attributes_for :next_of_kins, reject_if: :all_blank

  has_many :parent_details, dependent: :destroy
  accepts_nested_attributes_for :parent_details, reject_if: :all_blank

  has_many :children_details, dependent: :destroy
  accepts_nested_attributes_for :children_details, reject_if: :all_blank

  has_many :spouse_details, dependent: :destroy
  accepts_nested_attributes_for :spouse_details, reject_if: :all_blank

  has_one :salary_detail, dependent: :destroy
  accepts_nested_attributes_for :salary_detail, reject_if: :all_blank
end
