# encoding: utf-8

require 'spec_helper'

describe ProjectsController do

  before do
    setup_user(:user)
    @project_1 = FactoryGirl.create(:project, name: "Výzkum okružních křižovatek")
    @project_2 = FactoryGirl.create(:project, name: "Režie úseku SW")
  end

  ## INDEX ####################################################################
  it "vrati seznam projektu" do
    get :index, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"].count.should == 2
    body["content"][0]["name"].should == 'Režie úseku SW'
    body["content"][1]["name"].should == 'Výzkum okružních křižovatek'

    body["meta"]["total_pages"].should == 1
    body["meta"]["total_entries"].should == 2

    %w{id first_name surname job}.each do |attribute|
      body["content"][1][attribute].should == @project_1.attributes[attribute]
    end
  end

  ## SHOW #####################################################################
  it "vrati detail projektu" do
    get :show, id: @project_1.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    
    %w{date_from date_to}.each do |attribute|
      body["content"][attribute].should == @project_1.send(attribute.to_sym).try(:strftime, "%Y-%m-%d")
    end
  end

  ## CREATE ###################################################################
  it "vytvori projekt" do
    post :create, format: :json, project: PROJECT_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Project.last.id
  end

  it "nevytvori projekt bez nazvu" do
    post :create, format: :json, project: PROJECT_ATTRIBUTES.merge(name: "")

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## UPDATE ###################################################################
  it "upravi projekt" do
    put :update,
      format: :json,
      id: @project_1.id,
      project: { name: "Projekt 3" }

    response.status.should == 204
  end

  it "neupravi projekt bez nazvu" do
    post :update,
      format: :json,
      id: @project_1.id,
      project: { name: "" }

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## DESTROY ###################################################################
  it "smaze projekt" do
    delete :destroy, format: :json, id: @project_1.id
    response.status.should == 204
  end

  PROJECT_ATTRIBUTES = {
      number: "PR-3",
      name: "Projekt 3",
      acronym: "VPCDV2",
      date_from: Time.now,
      date_to: 3.year.since,
  }

end