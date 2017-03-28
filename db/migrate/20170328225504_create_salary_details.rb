class CreateSalaryDetails < ActiveRecord::Migration
  def change
    create_table :salary_details do |t|
      t.string :bankname
      t.string :branch
      t.string :account_number
      t.string :account_name
      t.string :ssnit_number
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
