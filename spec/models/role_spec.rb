require 'spec_helper'

describe Role do
  it { should validate_presence_of :code }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :code }
end
