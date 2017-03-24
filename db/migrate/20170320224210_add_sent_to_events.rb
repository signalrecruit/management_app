class AddSentToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :sent_by, :string, default: nil
  end
end
