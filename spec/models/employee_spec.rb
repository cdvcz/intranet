# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  status     :integer
#  date_from  :date                                   # Zamestnan od
#  date_to    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Employee do
  pending "add some examples to (or delete) #{__FILE__}"
end
