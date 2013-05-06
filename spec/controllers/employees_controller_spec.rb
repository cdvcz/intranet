# encoding: utf-8

require 'spec_helper'

describe EmployeesController do

  before do
    setup_user(:admin)
    @employee_1 = FactoryGirl.create(:employee, surname: "Novák")
    @employee_2 = FactoryGirl.create(:employee, surname: "Bartoš")
  end

  ## INDEX ####################################################################
  it "vrati seznam zamestnancu" do
    get :index, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"].count.should == 2
    body["content"][0]["surname"].should == 'Bartoš'
    body["content"][1]["surname"].should == 'Novák'

    body["meta"]["total_pages"].should == 1
    body["meta"]["total_entries"].should == 2

    %w{id first_name surname job}.each do |attribute|
      body["content"][1][attribute].should == @employee_1.attributes[attribute]
    end
  end

  ## SHOW #####################################################################
  it "vrati detail zamestnance" do
    get :show, id: @employee_1.id, format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)

    %w{employed_from employed_to}.each do |attribute|
      body["content"][attribute].should == @employee_1.send(attribute.to_sym).try(:strftime, "%Y-%m-%d %H:%M:%S")
    end

    %w{id number full_name_with_titles job email
       phone phone_cellular}.each do |attribute|
      body["content"][attribute].should == @employee_1.send(attribute.to_sym)
    end
   end

  ## CREATE ###################################################################
  it "vytvori zamestnance" do
    post :create, format: :json, employee: EMPLOYEE_ATTRIBUTES

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)
    body["content"]["id"].should == Employee.last.id
  end

  it "nevytvori zamestnance bez prijmeni" do
    post :create, format: :json, employee: EMPLOYEE_ATTRIBUTES.merge(surname: "")

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["surname"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## UPDATE ###################################################################
  it "upravi zamestnance" do
    put :update,
      format: :json,
      id: @employee_1.id,
      employee: { surname: "Lucemburský" }

    response.status.should == 204
  end

  it "neupravi zamestnance bez prijmeni" do
    post :update,
      format: :json,
      id: @employee_1.id,
      employee: { surname: "" }

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)
    body["errors"].count.should == 1
    body["errors"]["surname"].should include "Toto pole nemůže zůstat prázdné"
  end

  ## DESTROY ###################################################################
  it "smaze zamestnance" do
    delete :destroy, format: :json, id: @employee_1.id
    response.status.should == 204
  end

  EMPLOYEE_ATTRIBUTES = {
      first_name: "Jan",
      surname: "Hus",
      number: "123",
      phone: "731 123 123",
      email: "hus@cdv.cz"}

end
