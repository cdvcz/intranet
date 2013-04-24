class Employee < ActiveRecord::Base
  attr_protected :created_at

  validates :surname, presence: true

  def full_name_with_titles
    [ title_prefix, first_name, surname, title_suffix ].
      reject{|attr| attr.blank?}.join(" ")
  end
end
