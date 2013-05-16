class Person < ActiveRecord::Base
  attr_protected :created_at, :updated_at

  validates :last_name, presence: true
end
