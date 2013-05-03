class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many :roles
  attr_protected :created_at, :updated_at

  validates :login, presence: true
  validates :password, presence: true, on: :create

  def has_role?(role_code)
    roles.find_by_code(role_code.to_s) != nil
  end
end
