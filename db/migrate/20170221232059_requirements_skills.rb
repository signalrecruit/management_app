class RequirementsSkills < ActiveRecord::Migration
  def change
  	create_table :requirements_skills, id: false do |t|
  	  t.belongs_to :requirement
  	  t.belongs_to :skill
  	end
  	add_index :requirements_skills, [:requirement_id, :skill_id], unique: true
  end
end
