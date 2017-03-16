class AddAttachmentToApplicantDetails < ActiveRecord::Migration
  def change
  	add_column :applicant_details, :attachment, :string
  end
end
