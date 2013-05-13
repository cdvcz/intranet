# encoding: utf-8
# author: martinbachtikcdvcz

require 'spec_helper'

describe DatafilesController do

  DATAFILE1CREATE =
  {
    name: 'Soubor 1 Create'
  }

  DATAFILE1UPDATE1 =
  {
    name: 'Soubor 1 Update 1'
  }

  DATAFILE1UPDATE2 =
  {
    name: ''
  }

  DATAFILE2CREATE =
  {
    name: 'Soubor 2 Create'
  }

  DATAFILE3CREATE =
  {
    name: 'Soubor 3 Create',
    description: 'Popis k souboru',
    data_file_name: 'soubor3.pdf',
    data_file_size: 1024,
    data_content_type: 'text/pdf'
  }

  DATAFILE4CREATE =
  {
    name: '',
    description: 'Popis k souboru',
    data_file_name: 'soubor4.pdf',
    data_file_size: 1024,
    data_content_type: 'text/pdf'
  }

  before do
    setup_user(:admin)
    @datafile1 = FactoryGirl.create(:datafile,DATAFILE1CREATE)
    @datafile2 = FactoryGirl.create(:datafile,DATAFILE2CREATE)
  end

  # index #

  it 'vrátí seznam souborů' do
    get :index,format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)

    body['content'].count.should == 2

    body['meta']['total_pages'].should == 1
    body['meta']['total_entries'].should == 2

    %w{id name description data_file_name data_file_size data_content_type}.each do |attribute|
      body['content'][0][attribute].should == @datafile1.attributes[attribute]
    end

    %w{id name description data_file_name data_file_size data_content_type}.each do |attribute|
      body['content'][1][attribute].should == @datafile2.attributes[attribute]
    end
  end

  # show #

  it 'vrátí detail souboru' do
    get :show,id: @datafile1.id,format: :json

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)

    %w{id name description data_file_name data_file_size data_content_type}.each do |attribute|
      body['content'][attribute].should == @datafile1.attributes[attribute]
    end
  end

  # create #

  it 'vytvoří soubor' do
    post :create,format: :json,datafile: DATAFILE3CREATE

    response.status.should == 200
    body = ActiveSupport::JSON.decode(response.body)

    body['content']['id'].should == Datafile.last.id
  end

  it 'nevytvoří soubor bez názvu' do
    post :create,format: :json,datafile: DATAFILE4CREATE

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)

    body['errors'].count.should == 1
    body['errors']['name'].should include 'Toto pole nemůže zůstat prázdné'
  end

  # update #

  it 'aktualizuje soubor' do
    put :update,format: :json,id: @datafile1.id,datafile: DATAFILE1UPDATE1

    response.status.should == 204
  end

  it 'neaktualizuje soubor bez názvu' do
    post :update,format: :json,id: @datafile1.id,datafile: DATAFILE1UPDATE2

    response.status.should == 422
    body = ActiveSupport::JSON.decode(response.body)

    body['errors'].count.should == 1
    body['errors']['name'].should include 'Toto pole nemůže zůstat prázdné'
  end

  # destroy #

  it 'odstraní soubor' do
    delete :destroy,format: :json,id: @datafile1.id
    
    response.status.should == 204
  end

end