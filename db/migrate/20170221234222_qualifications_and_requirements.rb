class QualificationsAndRequirements < ActiveRecord::Migration
  def change  	
  	create_table :qualifications_requirements, id: false do |t|
  	  t.belongs_to :qualification
  	  t.belongs_to :requirement
  	end
  	add_index :qualifications_requirements, [:qualification_id, :requirement_id], :unique => true, :name => "qualifications_req"
  end
end
