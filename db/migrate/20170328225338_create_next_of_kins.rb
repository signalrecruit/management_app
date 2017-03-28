class CreateNextOfKins < ActiveRecord::Migration
  def change
    create_table :next_of_kins do |t|
      t.string :name
      t.string :relationship
      t.string :phonenumber
      t.string :address
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
