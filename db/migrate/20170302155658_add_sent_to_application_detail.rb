class AddSentToApplicationDetail < ActiveRecord::Migration
  def change
  	add_column :applicant_details, :sent, :boolean, default: false
  end
end
