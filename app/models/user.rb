class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  attr_protected :created_at, :updated_at

  def has_role?(role_code)
    roles.find_by_code(role_code.to_s) != nil
  end
end
