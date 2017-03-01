class RemoveScoreAttributesFromCompulsoryRequirement < ActiveRecord::Migration
  def change
    remove_column :compulsory_requirements, :score_1, :integer
    remove_column :compulsory_requirements, :score_2, :integer
    remove_column :compulsory_requirements, :score_3, :integer
    remove_column :compulsory_requirements, :score_4, :integer
    remove_column :compulsory_requirements, :score_5, :integer
    remove_column :compulsory_requirements, :score_6, :integer
    remove_column :compulsory_requirements, :score_7, :integer
    remove_column :compulsory_requirements, :score_8, :integer
    remove_column :compulsory_requirements, :score_9, :integer
    remove_column :compulsory_requirements, :score_10, :integer	
  end
end
