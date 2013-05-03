class CreateEmployeeUserJoinTable < ActiveRecord::Migration
  def change
    create_table :employees_users, :id => false do |t|
      t.integer :employee_id
      t.integer :user_id
    end
  end
end
