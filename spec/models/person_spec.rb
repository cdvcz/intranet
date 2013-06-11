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

require 'spec_helper'

describe Person do
  it { should validate_presence_of :last_name }
end
