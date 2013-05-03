require 'spec_helper'

describe "people/show" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :status => 1,
      :first_name => "First Name",
      :second_name => "Second Name",
      :last_name => "Last Name",
      :title_prefix => "Title Prefix",
      :title_suffix => "Title Suffix",
      :sex => 2,
      :number => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/First Name/)
    rendered.should match(/Second Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Title Prefix/)
    rendered.should match(/Title Suffix/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
