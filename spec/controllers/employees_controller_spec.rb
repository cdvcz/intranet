# encoding: utf-8

require 'spec_helper'

describe EmployeesController do

  before do
    setup_user(:admin)

    @employee_1 = FactoryGirl.create(:employee)
    @employee_1.person.update_attributes(last_name: "Novák")

    @employee_2 = FactoryGirl.create(:employee)
    @employee_2.person.update_attributes(last_name: "Bartoš")
  end

  ## INDEX ####################################################################
  it "vrati seznam zamestnancu" do
    get :index, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)

    body["content"].count.should == 2
    body["content"][0]["person"]["last_name"].should == 'Bartoš'
    body["content"][1]["person"]["last_name"].should == 'Novák'

    body["meta"]["total_pages"].should == 1
    body["meta"]["total_entries"].should == 2
  end

  ## SHOW #####################################################################
  it "vrati detail zamestnance" do
    get :show, id: @employee_1.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)

    %w{date_from date_to}.each do |attribute|
      body["content"][attribute].should == @employee_1.send(attribute.to_sym).try(:strftime, "%Y-%m-%d")
    end

    body["content"]["person"]["first_name"].should == @employee_1.person.first_name
    body["content"]["person"]["last_name"].should == @employee_1.person.last_name
  end

  ## CREATE ###################################################################
  it "vytvori zamestnance" do
    post :create, format: :json, employee: EMPLOYEE_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Employee.last.id
  end

  it "nevytvori zamestnance bez prijmeni" do
    post :create, format: :json,
      employee: EMPLOYEE_ATTRIBUTES.merge(person_attributes: { last_name: "" })

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["person.last_name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## UPDATE ###################################################################
  it "upravi zamestnance" do
    put :update,
      format: :json,
      id: @employee_1.id,
      employee: { person_attributes: { last_name: "Lucemburský" } }

    response.status.should == 204
  end

  it "neupravi zamestnance bez prijmeni" do
    post :update,
      format: :json,
      id: @employee_1.id,
      employee: { person_attributes: { last_name: "" } }

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["person.last_name"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## DESTROY ###################################################################
  it "smaze zamestnance" do
    delete :destroy, format: :json, id: @employee_1.id
    response.status.should == 204
  end

  EMPLOYEE_ATTRIBUTES = {
    person_attributes: {
    first_name: "Jan",
    last_name: "Hus" }
  }

end
