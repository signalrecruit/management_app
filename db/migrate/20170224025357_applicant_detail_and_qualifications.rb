class ApplicantDetailAndQualifications < ActiveRecord::Migration
  def change
    create_table :applicant_details_qualifications, id: false do |t|
      t.belongs_to :applicant_detail
      t.belongs_to :qualification 	
    end	

    add_index :applicant_details_qualifications, [:applicant_detail_id, :qualification_id], unique: true, name: "applicant_qualification"
  end
end
