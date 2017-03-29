class CreateChildrenDetails < ActiveRecord::Migration
  def change
    create_table :children_details do |t|
      t.string :name
      t.string :birthdate, default: nil
      t.string :school
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
