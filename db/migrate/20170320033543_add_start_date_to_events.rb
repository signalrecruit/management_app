class AddStartDateToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :interview_date, :datetime, default: nil
  	add_column :events, :test_date, :datetime, default: nil
  end
end
