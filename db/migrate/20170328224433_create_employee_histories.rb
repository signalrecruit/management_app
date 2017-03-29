class CreateEmployeeHistories < ActiveRecord::Migration
  def change
    create_table :employee_histories do |t|
      t.string :organization
      t.string :position
      t.datetime :from, default: nil
      t.datetime :to, default: nil
      t.text :reason_for_leaving
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
