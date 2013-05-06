# encoding: utf-8
require 'spec_helper'

describe UnitsController do

  before do
    @division1 = FactoryGirl.create(:unit, name: "Divize 1", abbreviation: "D1")
    @division2 = FactoryGirl.create(:unit, name: "Divize 2", abbreviation: "D2")
    @field11 = FactoryGirl.create(:unit, name: "Oblast 11", abbreviation: "O11", parent: @division1)
    @field12 = FactoryGirl.create(:unit, name: "Oblast 12", abbreviation: "O12", parent: @division1)
    @field21 = FactoryGirl.create(:unit, name: "Oblast 21", abbreviation: "O21", parent: @division2)
  end

  ## INDEX ###################################################################
  it "organizacni struktura" do
    get :index, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"].count.should == 5
    body["content"][0]["name"].should == "Divize 1"
    body["content"][1]["name"].should == "Divize 2"
  end

  ## SHOW ####################################################################
  it "detail divize 1" do
    get :show, id: @divize1.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    %w{id name abbreviation}.each do |attribute|
      body["content"][attribute].should == @divize1.send(attribute.to_sym)
    end
    body["content"]["parent_id"].should == nil
  end

  it "detail oblasti 11" do
    get :show, id: @field11.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    %w{id name abbreviation}.each do |attribute|
      body["content"][attribute].should == @field11.send(attribute.to_sym)
    end
    body["content"]["parent_id"].should == @divize1.id
  end

  ## CREATE ##################################################################
  it "vytvoreni divize" do
    post :create, format: :json, unit: DIVISION_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Unit.last.id
  end

  it "vytvoreni oblasti" do
    post :create, format: :json, unit: FIELD_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Unit.last.id
  end

  it "nevytvoreni bez nazvu" do
    post :create, format: :json, unit: DIVISION_ATTRIBUTES.merge(name: "")

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  it "nevytvoreni bez zkratky" do
    post :create, format: :json, unit: DIVISION_ATTRIBUTES.merge(abbreviation: "")

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["abbreviation"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## UPDATE ##################################################################
  it "upravi divizi" do
    put :update,
      format: :json,
      id: @division1.id,
      unit: { name: "Divize Jedna" }

    response.status.should == 204
  end

  it "neupravi divizi bez nazvu" do
    post :update,
      format: :json,
      id: @division1.id,
      unit: { name: "" }

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end
  
  it "neupravi divizi bez zkratky" do
    post :update,
      format: :json,
      id: @division1.id,
      unit: { abbreviation: "" }

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["abbreviation"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## DESTROY #################################################################
  it "smaze oblast" do
    delete :destroy, format: :json, id:@field12.id

    response.status.should == 204
  end

  it "nesmaze neprazdnou divizi" do
    delete :destroy, format: :json, id:@division1.id

    response.status.should == 422
  end

  DIVISION_ATTRIBUTES = {
    name: "Divize 1",
    abbreviation: "D1" }

  FIELD_ATTRIBUTES = {
    name: "Oblast 11",
    abbreviation: "O11",
    parent_id: 1 }
end
