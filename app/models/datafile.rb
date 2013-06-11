# == Schema Information
#
# Table name: datafiles
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  status            :integer
#  description       :text
#  data_file_name    :string(255)
#  data_file_size    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  data_content_type :string(255)
#

# author: martinbachtikcdvcz

class Datafile < ActiveRecord::Base

  attr_protected :created_at, :updated_at
  validates :name, presence: true
  validates :data_file_name, presence: true
  validates :data_file_size, presence: true

end
