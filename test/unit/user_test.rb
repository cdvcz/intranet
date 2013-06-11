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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
