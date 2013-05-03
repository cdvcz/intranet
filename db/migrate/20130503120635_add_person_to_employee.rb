class AddPersonToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :person_id, :integer, :after => :id
  end
end
