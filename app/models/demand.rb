# == Schema Information
#
# Table name: demands
#
#  id          :integer          not null, primary key
#  status      :integer
#  number      :string(255)
#  name        :string(255)
#  tax_year    :integer
#  description :text
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Demand < ActiveRecord::Base
  validates :name, presence: true
  validates :tax_year, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
