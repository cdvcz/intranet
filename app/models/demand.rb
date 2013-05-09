class Demand < ActiveRecord::Base
  validates :name, presence: true
  validates :tax_year, presence: true
  validates :description, presence: true
  validates :price, presence: true
end