class AddSentToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :sent, :boolean, default: false
  end
end
