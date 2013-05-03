require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :status => 1,
      :first_name => "MyString",
      :second_name => "MyString",
      :last_name => "MyString",
      :title_prefix => "MyString",
      :title_suffix => "MyString",
      :sex => 1,
      :number => 1
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input#person_status[name=?]", "person[status]"
      assert_select "input#person_first_name[name=?]", "person[first_name]"
      assert_select "input#person_second_name[name=?]", "person[second_name]"
      assert_select "input#person_last_name[name=?]", "person[last_name]"
      assert_select "input#person_title_prefix[name=?]", "person[title_prefix]"
      assert_select "input#person_title_suffix[name=?]", "person[title_suffix]"
      assert_select "input#person_sex[name=?]", "person[sex]"
      assert_select "input#person_number[name=?]", "person[number]"
    end
  end
end
