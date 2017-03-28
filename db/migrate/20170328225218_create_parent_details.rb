class CreateParentDetails < ActiveRecord::Migration
  def change
    create_table :parent_details do |t|
      t.string :parent_name
      t.string :birthdate
      t.string :alive
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
