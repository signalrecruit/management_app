class AddUpdateButtonToNextOfKins < ActiveRecord::Migration
  def change
  	add_column :next_of_kins, :update_button, :boolean, default: false
  end
end
