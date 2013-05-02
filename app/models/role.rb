class Role < ActiveRecord::Base
  attr_protected

  validates :code,
    presence: true,
    uniqueness: true

  validates :name,
    presence: true,
    uniqueness: true
end
