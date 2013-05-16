require 'spec_helper'

describe Person do
  it { should validate_presence_of :last_name }
end
