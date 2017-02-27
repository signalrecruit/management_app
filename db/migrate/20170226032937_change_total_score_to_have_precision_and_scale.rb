class ChangeTotalScoreToHavePrecisionAndScale < ActiveRecord::Migration
  def change
  	change_column :scores, :total_score, :decimal, precision: 3, scale: 1
  end
end
