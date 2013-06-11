# == Schema Information
#
# Table name: datafiles
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  status            :integer
#  description       :text
#  data_file_name    :string(255)
#  data_file_size    :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  data_content_type :string(255)
#

# author: martinbachtikcdvcz

require 'spec_helper'

describe Datafile do
  pending "add some examples to (or delete) #{__FILE__}"
end
