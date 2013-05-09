class ChangeUsersAttributesLogin < ActiveRecord::Migration
  def up
    rename_column :users, :login_username, :login
  end

  def down
  end
end