class JobTypeAndRequirements < ActiveRecord::Migration
  def change
    create_table :job_types_requirements, id: false do |t|
      t.belongs_to :job_type 
      t.belongs_to :requirement 
    end	

    add_index :job_types_requirements, [:job_type_id, :requirement_id], unique: true, name: "job_and_requirements"
  end
end
