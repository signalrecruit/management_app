class CreateCompulsoryRequirements < ActiveRecord::Migration
  def change
    create_table :compulsory_requirements do |t|
      t.text :requirement_1, default: nil
      t.integer :score_1, default: 1

      t.text :requirement_2, default: nil
      t.integer :score_2, default: 1
      
      t.text :requirement_3, default: nil
      t.integer :score_3, default: 1

      t.text :requirement_4, default: nil
      t.integer :score_4, default: 1

      t.text :requirement_5, default: nil
      t.integer :score_5, default: 1

      t.text :requirement_6, default: nil
      t.integer :score_6, default: 1

      t.text :requirement_7, default: nil
      t.integer :score_7, default: 1

      t.text :requirement_8, default: nil
      t.integer :score_8, default: 1

      t.text :requirement_9, default: nil
      t.integer :score_9, default: 1

      t.text :requirement_10, default: nil
      t.integer :score_10, default: 1






      t.belongs_to :requirement, index: true

      t.timestamps null: false
    end
  end
end
