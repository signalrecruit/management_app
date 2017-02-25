class ApplicantDetailsJobTypes < ActiveRecord::Migration
  def change
    create_table :applicant_details_job_types, id: false do |t|
      t.belongs_to :applicant_detail 
      t.belongs_to :job_type 	
    end	

    add_index :applicant_details_job_types, [:applicant_detail_id, :job_type_id], unique: true, name: "applicant_and_job"
  end
end
