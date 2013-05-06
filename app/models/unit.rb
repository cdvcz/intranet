class Unit < ActiveRecord::Base
  attr_protected :created_at, :updated_at, :lft, :rgt

  acts_as_nested_set
end
