# == Schema Information
#
# Table name: people
#
#  id           :integer          not null, primary key
#  status       :integer
#  first_name   :string(255)
#  second_name  :string(255)
#  last_name    :string(255)
#  title_prefix :string(255)
#  title_suffix :string(255)
#  sex          :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Person < ActiveRecord::Base
  attr_protected :created_at, :updated_at

  validates :last_name, presence: true
end
