# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  attr_protected

  validates :code,
    presence: true,
    uniqueness: true

  validates :name,
    presence: true,
    uniqueness: true
end
