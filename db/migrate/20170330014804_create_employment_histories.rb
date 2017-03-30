class CreateEmploymentHistories < ActiveRecord::Migration
  def change
    create_table :employment_histories do |t|
      t.string :organization
      t.string :position
      t.datetime :from
      t.datetime :to
      t.text :reason_for_leaving
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
