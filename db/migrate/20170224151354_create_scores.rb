class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.boolean :skills_check, default: false
      t.boolean :qualifications_check, default: false
      t.string :skills_note
      t.string :qualifications_note
      t.integer :skills_score, default: 0
      t.integer :qualifications_score, default: 0
      t.belongs_to :applicant_detail, index: true

      t.timestamps null: false
    end
  end
end
