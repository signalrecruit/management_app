class AddEmployeeAttributes < ActiveRecord::Migration
  def change
  	add_column :employees, :surname, :string, default: "surname"
  	add_column :employees, :middlename, :string, default: "middle name"
  	add_column :employees, :firstname, :string, default: "first name"
    add_column :employees, :birthdate, :datetime, default: Time.now
  	add_column :employees, :marital_status, :string, default: "single"
  	add_column :employees, :gender, :string, default: "male"
  	add_column :employees, :birthplace, :string, default: "your birth place"
  	add_column :employees, :region, :string, default: "Region"
  	add_column :employees, :country, :string, default: "Country"
  	add_column :employees, :commencement_date, :datetime, default: Time.now
  	add_column :employees, :position, :string, default: "position"
  	add_column :employees, :department, :string, default: "name of department"
  	add_column :employees, :postal_address, :string, default: "employee postal address"
  	add_column :employees, :city, :string, default: "name of your city"
  	add_column :employees, :house_number, :string, default: "employee house number"
  	add_column :employees, :office_number, :string, default: "office number here"
  	add_column :employees, :mobile_number, :string, default: "employee mobile number"
  	add_column :employees, :email_address, :string, default: "employee's email"
  	add_column :employees, :corporate_email, :string, default: "corporate email for employee"
  end
end
