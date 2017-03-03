class AddAcceptToApplicantDetails < ActiveRecord::Migration
  def change
  	add_column :applicant_details, :accept, :boolean, default: false
  end
end
