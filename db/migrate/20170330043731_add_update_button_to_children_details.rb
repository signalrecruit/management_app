class AddUpdateButtonToChildrenDetails < ActiveRecord::Migration
  def change
  	add_column :children_details, :update_button, :boolean, default: false
  end
end
