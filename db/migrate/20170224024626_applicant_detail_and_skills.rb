class ApplicantDetailAndSkills < ActiveRecord::Migration
  def change
  	create_table :applicant_details_skills, id: false do |t|
      t.belongs_to :applicant_detail
      t.belongs_to :skill
  	end

  	add_index :applicant_details_skills, [:applicant_detail_id, :skill_id], unique: true, name: "applicant_skills"
  end
end
