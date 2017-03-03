class AddReasonForRejectionToApplicantDetail < ActiveRecord::Migration
  def change
  	add_column :applicant_details, :reason_for_rejection, :text
  end
end
