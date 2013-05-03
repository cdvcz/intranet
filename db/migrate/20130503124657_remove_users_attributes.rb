class RemoveUsersAttributes < ActiveRecord::Migration
  def up
    rename_column   :users, :login_username, :login
    rename_column   :users, :password_digest, :password
    
    add_column      :users, :status, :integer, :after => :id
    add_column      :users, :name, :string, :after => :status

    remove_column   :users, :first_name
    remove_column   :users, :last_name
    remove_column   :users, :login_showname
    remove_column   :users, :login_allowed
    remove_column   :users, :login_last
    remove_column   :users, :login_password_old
    remove_column   :users, :login_password_last_changed
    remove_column   :users, :employee_id
    remove_column   :users, :login_redirect_to
  end

  def down
    rename_column   :users, :login, :login_username
    rename_column   :users, :password, :password_digest
    
    add_column      :users, :first_name, :string
    add_column      :users, :last_name, :string
    add_column      :users, :login_showname, :string
    add_column      :users, :login_allowed, :boolean
    add_column      :users, :login_last, :datetime
    add_column      :users, :login_password_old, :string
    add_column      :users, :login_password_last_changed, :datetime
    add_column      :users, :employee_id, :integer
    add_column      :users, :login_redirect_to, :string

    remove_column   :users, :status
    remove_column   :users, :name

  end
end
