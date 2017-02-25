class AddTotalScoreToScore < ActiveRecord::Migration
  def change
  	add_column :scores, :total_score, :integer
  end
end
