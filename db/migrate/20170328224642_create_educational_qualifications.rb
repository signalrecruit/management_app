class CreateEducationalQualifications < ActiveRecord::Migration
  def change
    create_table :educational_qualifications do |t|
      t.string :institution
      t.string :certificate
      t.datetime :enrolled_at
      t.datetime :completed_at
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
