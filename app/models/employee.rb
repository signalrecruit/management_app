class Employee < ActiveRecord::Base
  belongs_to :company
  belongs_to :applicant_detail
end
