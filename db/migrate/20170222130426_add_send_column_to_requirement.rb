class AddSendColumnToRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :sent, :datetime, default: nil
  end
end
