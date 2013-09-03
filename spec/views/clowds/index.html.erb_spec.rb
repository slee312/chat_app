require 'spec_helper'

describe "clowds/index" do
  before(:each) do
    assign(:clowds, [
      stub_model(Clowd,
        :name => "Name",
        :description => "MyText",
        :approvals => 1,
        :flags => 2,
        :status => 3,
        :icon => "Icon"
      ),
      stub_model(Clowd,
        :name => "Name",
        :description => "MyText",
        :approvals => 1,
        :flags => 2,
        :status => 3,
        :icon => "Icon"
      )
    ])
  end

  it "renders a list of clowds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
  end
end
