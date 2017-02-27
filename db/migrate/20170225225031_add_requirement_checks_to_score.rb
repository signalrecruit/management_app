class AddRequirementChecksToScore < ActiveRecord::Migration
  def change
  	add_column :scores, :requirement_1_check, :boolean, default: nil
  	add_column :scores, :requirement_2_check, :boolean, default: nil
  	add_column :scores, :requirement_3_check, :boolean, default: nil
  	add_column :scores, :requirement_4_check, :boolean, default: nil
  	add_column :scores, :requirement_5_check, :boolean, default: nil
  	add_column :scores, :requirement_6_check, :boolean, default: nil
  	add_column :scores, :requirement_7_check, :boolean, default: nil
  	add_column :scores, :requirement_8_check, :boolean, default: nil
  	add_column :scores, :requirement_9_check, :boolean, default: nil
  	add_column :scores, :requirement_10_check, :boolean, default: nil

  	add_column :scores, :requirement_1_score, :decimal, default: nil
  	add_column :scores, :requirement_2_score, :decimal,  default: nil
  	add_column :scores, :requirement_3_score, :decimal,  default: nil
  	add_column :scores, :requirement_4_score, :decimal,  default: nil
  	add_column :scores, :requirement_5_score, :decimal,  default: nil
  	add_column :scores, :requirement_6_score, :decimal,  default: nil
  	add_column :scores, :requirement_7_score, :decimal,  default: nil
  	add_column :scores, :requirement_8_score, :decimal,  default: nil
  	add_column :scores, :requirement_9_score, :decimal,  default: nil
  	add_column :scores, :requirement_10_score, :decimal, default: nil
  	add_column :scores, :requirement_total_score, :decimal, precision: 4, scale: 2, default: nil
  end
end
