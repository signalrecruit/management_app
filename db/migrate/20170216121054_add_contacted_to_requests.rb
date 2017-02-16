class AddContactedToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :contacted, :boolean, default: false
  end
end
