class AddUpdateButtonToEducationalQualifications < ActiveRecord::Migration
  def change
  	add_column :educational_qualifications, :update_button, :boolean, default: false
  end
end
