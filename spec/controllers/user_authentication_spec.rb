require 'spec_helper'

describe SessionsController do

  it "Uzivatel se spravnym heslem se prihlasi" do
    User.create!(password: "heslo", login_username: "test")

    post :create, login_username: 'test', login_password: 'heslo'

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["authorized"].should be_true
    body["content"]["user"]["login_username"].should == 'test'
  end

  it "Uzivatel s nespravnym heslem se neprihlasi" do
    User.create!(password: "heslo", login_username: "test")

    post :create, login_username: 'test', password: 'spatneheslo'

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["authorized"].should be_false
    body["content"].should be_nil
  end


end
