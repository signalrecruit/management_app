class CreateApplicantDetails < ActiveRecord::Migration
  def change
    create_table :applicant_details do |t|
      t.string :name
      t.string :email
      t.string :phonenumber
      t.string :location
      t.integer :experience
      t.integer :min_salary
      t.integer :max_salary
      t.references :requirement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
