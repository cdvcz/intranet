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
