class AddColumnNoteRequirement < ActiveRecord::Migration
  def change
  	add_column :requirements, :note, :text
  end
end
