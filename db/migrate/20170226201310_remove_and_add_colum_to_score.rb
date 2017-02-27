class RemoveAndAddColumToScore < ActiveRecord::Migration
  def change
  	remove_column :scores, :total_score, :decimal, precision: 3, scale: 1
  	add_column :scores, :total_score, :decimal
  end
end
