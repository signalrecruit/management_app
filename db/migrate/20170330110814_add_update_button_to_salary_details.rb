class AddUpdateButtonToSalaryDetails < ActiveRecord::Migration
  def change
  	add_column :salary_details, :update_button, :boolean, default: false
  end
end
