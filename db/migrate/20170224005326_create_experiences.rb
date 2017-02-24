class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.string :job_title
      t.string :location
      t.text :description
      t.references :applicant_detail, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
