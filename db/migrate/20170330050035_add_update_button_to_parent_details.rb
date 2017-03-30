class AddUpdateButtonToParentDetails < ActiveRecord::Migration
  def change
  	add_column :parent_details, :update_button, :boolean, default: false
  end
end
