class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :fullname
      t.string :phonenumber
      t.string :email
      t.string :company
      t.string :job_title

      t.timestamps null: false
    end
  end
end
