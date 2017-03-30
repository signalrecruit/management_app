class AddUpdateButtonToSpouseDetails < ActiveRecord::Migration
  def change
  	add_column :spouse_details, :update_button, :boolean, default: false
  end
end
