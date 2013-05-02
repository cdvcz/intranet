class Project < ActiveRecord::Base
  attr_protected :created_at, :updated_at

  validates :name, presence: true
end