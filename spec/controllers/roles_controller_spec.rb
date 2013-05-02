# encoding: utf-8

require 'spec_helper'

describe RolesController do

  before do
    setup_user(:user)
    @role_1 = FactoryGirl.create(:role, code: 'user_role')
    @role_2 = FactoryGirl.create(:admin_role, code: 'admin_role')
  end

  ## INDEX ####################################################################
  it "vrati seznam roli" do
    get :index, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"].count.should == 2
    body["content"][0]["code"].should == 'user_role'
    body["content"][1]["code"].should == 'admin_role'

    body["meta"]["total_pages"].should == 1
    body["meta"]["total_entries"].should == 2
  end

  ## SHOW #####################################################################
  it "vrati detail role" do
    get :show, id: @role_1.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == @role_1.id
    body["content"]["code"].should == "user_role"
  end

  ## CREATE ###################################################################
  it "vytvori roli" do
    post :create, format: :json, role: ROLE_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Role.last.id
  end

  it "nevytvori roli bez nazvu" do
    post :create, format: :json, role: ROLE_ATTRIBUTES.merge(name: "")

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## UPDATE ###################################################################
  it "upravi roli" do
    put :update,
      format: :json,
      id: @role_1.id,
      role: { name: "Administrator systemu" }

    response.status.should == 204
  end

  it "neupravi roli bez nazvu" do
    post :update,
      format: :json,
      id: @role_1.id,
      role: { name: "" }

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## DESTROY ###################################################################
  it "smaze roli" do
    delete :destroy, format: :json, id: @role_1.id
    response.status.should == 204
  end

  ROLE_ATTRIBUTES = {
    code: 'user',
    name: 'Uživatel'
  }
end
