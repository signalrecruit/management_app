class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string :title
      t.string :job_type
      t.string :location
      t.integer :experience
      t.decimal :min_salary
      t.decimal :max_salary
      t.integer :number_of_vacancies
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
