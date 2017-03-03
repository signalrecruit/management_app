class ChangeDefaultForTotalScoreToZero < ActiveRecord::Migration
  def change
  	change_column :scores, :total_score, :decimal, default: 0
  end
end
