class AddAndChangeColumnsToApplicantDetailsAndScores < ActiveRecord::Migration
  def change
    add_column  :applicant_details, :job_title, :string
    change_column :scores, :skills_score, :decimal
    change_column :scores, :qualifications_score, :decimal
    change_column :scores, :total_score, :decimal
  end
end
