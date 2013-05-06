class Unit < ActiveRecord::Base
  attr_protected :created_at, :updated_at, :lft, :rgt

  validates :name, presence: true
  validates :abbreviation, presence: true

  acts_as_nested_set
end
