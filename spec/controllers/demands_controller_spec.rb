# encoding: utf-8

require 'spec_helper'

describe DemandsController do

  before do
    setup_user(:admin)
    @demand_1 = FactoryGirl.create(:demand, name: "Notebook")
    @demand_2 = FactoryGirl.create(:demand, name: "Kancelářské potřeby")
    @demand_3 = FactoryGirl.create(:demand, name: "Akumulátory")
  end

  ## INDEX ####################################################################
  it "vrati seznam zadanek" do
    get :index, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"].count.should == 3
    body["content"][0]["name"].should == 'Akumulátory'
    body["content"][1]["name"].should == 'Kancelářské potřeby'
    body["content"][2]["name"].should == 'Notebook'

    body["meta"]["total_pages"].should == 1
    body["meta"]["total_entries"].should == 3

    %w{id status number name tax_year description price}.each do |attribute|
      body["content"][2][attribute].should == @demand_1.attributes[attribute]
    end
  end

  ## SHOW #####################################################################
  it "vrati detail zadanky" do
    get :show, id: @demand_1.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)

    %w{id status number name tax_year description price}.each do |attribute|
      body["content"][attribute].should == @demand_1.send(attribute.to_sym)
    end
   end

  ## CREATE ###################################################################
  it "vytvori zadanku" do
    post :create, format: :json, demand: DEMAND_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Demand.last.id
  end

  it "nevytvori zadanku bez nazvu" do
    post :create, format: :json, demand: DEMAND_ATTRIBUTES.merge(name: "")

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## UPDATE ###################################################################
  it "upravi zadanku" do
    put :update,
      format: :json,
      id: @demand_1.id,
      demand: { name: "Žárovky do auta" }

    response.status.should == 204
  end

  it "neupravi zadanku bez nazvu" do
    post :update,
      format: :json,
      id: @demand_1.id,
      demand: { name: "" }

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## DESTROY ###################################################################
  it "smaze zadanku" do
    delete :destroy, format: :json, id: @demand_1.id
    response.status.should == 204
  end

  DEMAND_ATTRIBUTES = {
    number: "ZAD/20130506001",
    name: "Sluchátka",
    tax_year: "2013",
    description: "Sluchátka pro provoz Skype",
    price: "549"
  }

end