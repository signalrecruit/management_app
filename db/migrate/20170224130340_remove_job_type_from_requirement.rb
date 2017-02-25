class RemoveJobTypeFromRequirement < ActiveRecord::Migration
  def change
  	remove_column :requirements, :job_type, :string
  end
end
