class CreateParentDetails < ActiveRecord::Migration
  def change
    create_table :parent_details do |t|
      t.string :name
      t.datetime :birthdate, default: nil
      t.string :status, default: "alive"
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
