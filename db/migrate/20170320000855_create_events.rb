class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :brief_description
      t.references :applicant_detail, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
