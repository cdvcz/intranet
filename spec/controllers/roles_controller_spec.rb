# encoding: utf-8

require 'spec_helper'

describe RolesController do

  # Kontrola, zda je zapnuta kontrola prav - ostatni ability se kontroluji v roles_ability_spec.rb
  context "Uzivatel s roli 'user'" do
    it "nema pristup do roli" do
      setup_user(:user)

      get :index, format: :json

      response.status.should == 403
    end
  end

  context "Uzivatel s roli 'administrator'" do
    before do
      setup_user(:admin)

      @role_1 = FactoryGirl.create(:role)
      @role_2 = FactoryGirl.create(:admin_role)
    end

    ## INDEX ####################################################################
    it "vidi seznam roli" do
      get :index, format: :json

      response.status.should == 200
      body = ActiveSupport::JSON.decode(response.body)
      # Pozn: setup_user take vytvori roli, takze jich je celkem 3
      body["content"].count.should == 3
      body["content"][1]["code"].should == @role_1.code
      body["content"][2]["code"].should == @role_2.code

      body["meta"]["total_pages"].should == 1
      body["meta"]["total_entries"].should == 3
    end

    ## SHOW #####################################################################
    it "vidi detail role" do
      get :show, id: @role_1.id, format: :json

      response.status.should == 200
      body = ActiveSupport::JSON.decode(response.body)
      body["content"]["id"].should == @role_1.id
      body["content"]["code"].should == @role_1.code
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

  end

  ROLE_ATTRIBUTES = {
    code: 'rolecode',
    name: 'Uživatelska role'
  }
end
