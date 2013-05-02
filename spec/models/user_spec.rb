require 'spec_helper'

describe User do
  it { should validate_presence_of :login_username }
  it { should have_and_belong_to_many :roles }
end
