class AddSentToCompanies < ActiveRecord::Migration
  def change
  	add_column :employees, :sent, :boolean, default: false
  end
end
