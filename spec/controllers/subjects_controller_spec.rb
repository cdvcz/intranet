# encoding: utf-8

require 'spec_helper'

describe SubjectsController do
  before do
    setup_user(:admin)
    @subject_1 = FactoryGirl.create(:subject, name: "Google")
    @subject_2 = FactoryGirl.create(:subject, name: "Apple")
  end

  ## INDEX ####################################################################
  it "vrati seznam subjektu" do
    get :index, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"].count.should == 2
    body["content"][0]["name"].should == 'Apple'
    body["content"][1]["name"].should == 'Google'

    body["meta"]["total_pages"].should == 1
    body["meta"]["total_entries"].should == 2

    %w{id name registration_number}.each do |attribute|
      body["content"][1][attribute].should == @subject_1.attributes[attribute]
    end
  end

  ## SHOW #####################################################################
  it "vrati detail subjektu" do
    get :show, id: @subject_1.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    %w{id name registration_number registration_number_tax tax_registration
       email phone phone_cellular www}.each do |attribute|
      body["content"][attribute].should == @subject_1.send(attribute.to_sym)
    end
  end

  ## CREATE ###################################################################
  it "vytvori subjekt" do
    post :create, format: :json, subject: SUBJECT_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Subject.last.id
  end

  it "nevytvori subjekt bez nazvu" do
    post :create, format: :json, subject: SUBJECT_ATTRIBUTES.merge(name: "")

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## UPDATE ###################################################################
  it "upravi subjekt" do
    put :update,
      format: :json,
      id: @subject_1.id,
      subject: { name: "Facebook" }

    response.status.should == 204
  end

  it "neupravi subjekt bez nazvu" do
    post :update,
      format: :json,
      id: @subject_1.id,
      subject: { name:  ""}

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## DESTROY ###################################################################
  it "smaze subjekt" do
    delete :destroy, format: :json, id: @subject_1.id
    response.status.should == 204
  end

  SUBJECT_ATTRIBUTES = {
      name: "Amazon",
      registration_number: "123",
      phone: "731 123 123",
      email: "info@amazon.com"}

end
