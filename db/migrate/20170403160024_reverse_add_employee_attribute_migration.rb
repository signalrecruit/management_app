class ReverseAddEmployeeAttributeMigration < ActiveRecord::Migration
  def change
  	change_column :employees, :surname, :string, default: nil 
  	change_column :employees, :middlename, :string, default: nil 
  	change_column :employees, :firstname, :string, default: nil
    change_column :employees, :birthdate, :datetime, default: Time.now
  	change_column :employees, :marital_status, :string, default: nil
  	change_column :employees, :gender, :string, default: nil
  	change_column :employees, :birthplace, :string, default: nil 
  	change_column :employees, :region, :string, default: nil
  	change_column :employees, :country, :string, default: nil 
  	change_column :employees, :commencement_date, :datetime, default: Time.now
  	change_column :employees, :position, :string, default: nil 
  	change_column :employees, :department, :string, default: nil 
  	change_column :employees, :postal_address, :string, default: nil 
  	change_column :employees, :city, :string, default: nil 
  	change_column :employees, :house_number, :string, default: nil 
  	change_column :employees, :office_number, :string, default: nil 
  	change_column :employees, :mobile_number, :string, default: nil 
  	change_column :employees, :email_address, :string, default: nil 
  	change_column :employees, :corporate_email, :string, default: nil
  end
end
