class ChangeUsersAttributes < ActiveRecord::Migration
  def up
    rename_column :users, :login, :login_username
    rename_column :users, :password, :password_digest

    add_column :users, :login_showname, :string
    add_column :users, :login_allowed, :boolean
    add_column :users, :login_last, :datetime
    add_column :users, :login_password_old, :string
    add_column :users, :login_password_last_changed, :datetime
  end

  def down
  end
end
