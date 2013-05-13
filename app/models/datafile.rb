# author: martinbachtikcdvcz

class Datafile < ActiveRecord::Base

  attr_protected :created_at, :updated_at
  validates :name, presence: true
  validates :data_file_name, presence: true
  validates :data_file_size, presence: true

end