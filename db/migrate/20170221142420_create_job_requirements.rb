class CreateJobRequirements < ActiveRecord::Migration
  def change
    create_table :job_requirements do |t|
      t.string :title
      t.string :location
      t.string :job_type
      t.integer :experience
      t.decimal :min_salary
      t.decimal :max_salary
      t.integer :number_of_vacancies
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
