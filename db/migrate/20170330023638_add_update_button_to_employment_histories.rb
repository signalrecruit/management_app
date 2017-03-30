class AddUpdateButtonToEmploymentHistories < ActiveRecord::Migration
  def change
  	add_column :employment_histories, :update_button, :boolean, default: false
  end
end
