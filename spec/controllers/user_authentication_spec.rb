require 'spec_helper'

describe CdvSession::SessionsController do

  it "Uzivatel se spravnym heslem se prihlasi" do
    user = User.create(name: "Jan Hus")
    CdvSession::Account.stub(:get).and_return("user_id" => user.id)

    post :create, use_route: :cdv_service, login: 'test', password: 'heslo', format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["authorized"].should be_true
    body["content"]["user"]["name"].should == 'Jan Hus'
  end

  it "Uzivatel s nespravnym heslem se neprihlasi" do
    User.create!(name: "Jan Hus")

    VCR.use_cassette('sessions/create') do
      post :create, use_route: :cdv_service, login: 'test', password: 'spatneheslo', format: :json

      response.status.should == 200
      body = ActiveSupport::JSON.decode(response.body)
      body["authorized"].should be_false
      body["content"].should be_nil
    end
  end

end
