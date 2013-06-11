# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  status     :integer
#  date_from  :date                                   # Zamestnan od
#  date_to    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ActiveRecord::Base
  belongs_to :person
  accepts_nested_attributes_for :person

  has_and_belongs_to_many :users

  attr_protected :created_at, :updated_at

  validates :person, presence: true

  def full_name_with_titles
    #[ title_prefix, first_name, surname, title_suffix ].reject{|attr| attr.blank?}.join(" ")
  end
end
