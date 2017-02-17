class AddUniquenessToEmail < ActiveRecord::Migration
  def change
    change_column :requests, :email, :string, unique: true
  end
end
