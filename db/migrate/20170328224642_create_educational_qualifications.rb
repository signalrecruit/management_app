class CreateEducationalQualifications < ActiveRecord::Migration
  def change
    create_table :educational_qualifications do |t|
      t.string :institution
      t.string :certificate
      t.datetime :enrolled_at, default: nil
      t.datetime :completed_at, default: nil
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
