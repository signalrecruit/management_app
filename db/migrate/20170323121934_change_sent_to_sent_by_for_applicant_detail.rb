class ChangeSentToSentByForApplicantDetail < ActiveRecord::Migration
  def change
  	remove_column :applicant_details, :sent, :boolean
  	add_column :applicant_details, :sent_by, :string, default: nil
  end
end
