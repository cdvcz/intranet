# == Schema Information
#
# Table name: units
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  abbreviation :string(255)
#  parent_id    :integer
#  lft          :integer
#  rgt          :integer
#  depth        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Unit do
  pending "add some examples to (or delete) #{__FILE__}"
end
