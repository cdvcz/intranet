# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  status          :integer
#  name            :string(255)
#  login           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  it { should have_and_belong_to_many :roles }
end
