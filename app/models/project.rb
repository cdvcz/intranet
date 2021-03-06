# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  status     :integer
#  number     :string(255)
#  name       :string(255)
#  name_en    :string(255)
#  acronym    :string(255)
#  date_from  :date
#  date_to    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base
  attr_protected :created_at, :updated_at

  validates :name, presence: true
end
