class AddColumnsToCompanyTable < ActiveRecord::Migration
  def change
  	add_column :companies, :phonenumber, :string
  	add_column :companies, :name, :string, unique: true
  	add_column :companies, :auth_code, :string
  end
end
