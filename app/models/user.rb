class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :login_username, :login_allowed,
    :password, :password_confirmation

  validates :login_username, presence: true
  validates :password, presence: true, on: :create
end
