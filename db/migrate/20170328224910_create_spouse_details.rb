class CreateSpouseDetails < ActiveRecord::Migration
  def change
    create_table :spouse_details do |t|
      t.string :name
      t.datetime :birthdate, default: nil
      t.string :profession
      t.string :phonenumber
      t.string :address
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
