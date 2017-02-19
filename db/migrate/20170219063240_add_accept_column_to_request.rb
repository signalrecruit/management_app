class AddAcceptColumnToRequest < ActiveRecord::Migration
  def change
  	add_column :requests, :accepted_offer, :boolean, default: nil
  end
end
