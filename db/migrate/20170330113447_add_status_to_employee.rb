class AddStatusToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :profile_status, :string, default: "INCOMPLETE"
  end
end
