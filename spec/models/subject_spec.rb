# == Schema Information
#
# Table name: subjects
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  registration_number     :string(255)
#  registration_number_tax :string(255)
#  tax_registration        :string(255)
#  email                   :string(255)
#  phone                   :string(255)
#  phone_cellular          :string(255)
#  www                     :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

require 'spec_helper'

describe Subject do
  pending "add some examples to (or delete) #{__FILE__}"
end
