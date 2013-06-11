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

require 'spec_helper'

describe Demand do
  pending "add some examples to (or delete) #{__FILE__}"
end
