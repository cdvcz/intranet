# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  status          :integer
#  name            :string(255)
#  login           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  attr_protected :created_at, :updated_at

  def has_role?(role_code)
    roles.find_by_code(role_code.to_s) != nil
  end
end
