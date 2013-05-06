class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :login_username, :login_allowed,
    :password, :password_confirmation

  has_and_belongs_to_many :roles

  validates :login_username, presence: true
  validates :password, presence: true, on: :create


  def has_role?(role_code)
    roles.find_by_code(role_code.to_s) != nil
  end
end
