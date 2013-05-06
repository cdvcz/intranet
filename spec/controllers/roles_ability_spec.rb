require 'spec_helper'

describe RolesController do

  describe "user with role 'user'" do
    before { setup_user('user') }

    %w(index create new update).each do |action|
      it "cannot #{action} Role" do
        @ability.should_not be_able_to(action.to_sym, Role)
      end
    end
  end

  describe "User with role 'admin'" do
    before { setup_user('admin') }

    %w(index create new update).each do |action|
      it "can #{action} Role" do
        @ability.should be_able_to(action.to_sym, Role)
      end
    end
  end
end
