class AddConfirmStatusToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :confirm, :string, default: "Not Confirmed"
  end
end
