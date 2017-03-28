class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :company, index: true, foreign_key: true
      t.references :applicant_detail, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
