class Subject < ActiveRecord::Base
  attr_protected

  validates :name, presence: true
end
