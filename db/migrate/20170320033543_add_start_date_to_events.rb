class AddStartDateToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :interview_date, :datetime, default: Time.now
  	add_column :events, :test_date, :datetime, default: Time.now
  end
end
