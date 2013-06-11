# == Schema Information
#
# Table name: contracts
#
#  id             :integer          not null, primary key
#  status         :integer
#  number         :string(255)
#  subject        :text
#  tax_year       :integer
#  description    :text
#  deadline_date  :date
#  end_date       :date
#  archiving      :text
#  role_type      :string(255)
#  price_type     :string(255)
#  invoicing_note :text
#  note           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# author: mbach

require('spec_helper')

describe Contract do
  pending("add some examples to (or delete) #{__FILE__}")
end
