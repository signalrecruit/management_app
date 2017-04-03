class AddCompanyRefToApplicantDetails < ActiveRecord::Migration
  def change
    add_reference :applicant_details, :company, index: true, foreign_key: true
  end
end
