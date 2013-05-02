class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :code
      t.string :name
      t.integer :status

      t.timestamps
    end

    add_index :roles, :code
  end
end
