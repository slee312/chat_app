require 'spec_helper'

describe "clowds/edit" do
  before(:each) do
    @clowd = assign(:clowd, stub_model(Clowd,
      :name => "MyString",
      :description => "MyText",
      :approvals => 1,
      :flags => 1,
      :status => 1,
      :icon => "MyString"
    ))
  end

  it "renders the edit clowd form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clowds_path(@clowd), :method => "post" do
      assert_select "input#clowd_name", :name => "clowd[name]"
      assert_select "textarea#clowd_description", :name => "clowd[description]"
      assert_select "input#clowd_approvals", :name => "clowd[approvals]"
      assert_select "input#clowd_flags", :name => "clowd[flags]"
      assert_select "input#clowd_status", :name => "clowd[status]"
      assert_select "input#clowd_icon", :name => "clowd[icon]"
    end
  end
end
