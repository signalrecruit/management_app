class AddSchedulerToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :scheduler, :string, default: nil
  end
end
