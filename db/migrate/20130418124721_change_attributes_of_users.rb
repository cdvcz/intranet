class ChangeAttributesOfUsers < ActiveRecord::Migration
  def up
    add_column    :users, :employee_id, :integer
    add_column    :users, :login_redirect_to, :string
    remove_column :users, :email
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
