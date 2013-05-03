require 'spec_helper'

describe "people/index" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :status => 1,
        :first_name => "First Name",
        :second_name => "Second Name",
        :last_name => "Last Name",
        :title_prefix => "Title Prefix",
        :title_suffix => "Title Suffix",
        :sex => 2,
        :number => 3
      ),
      stub_model(Person,
        :status => 1,
        :first_name => "First Name",
        :second_name => "Second Name",
        :last_name => "Last Name",
        :title_prefix => "Title Prefix",
        :title_suffix => "Title Suffix",
        :sex => 2,
        :number => 3
      )
    ])
  end

  it "renders a list of people" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Second Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title Prefix".to_s, :count => 2
    assert_select "tr>td", :text => "Title Suffix".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
