# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Role do
  it { should validate_presence_of :code }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :code }
end
