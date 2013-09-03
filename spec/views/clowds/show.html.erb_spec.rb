require 'spec_helper'

describe "clowds/show" do
  before(:each) do
    @clowd = assign(:clowd, stub_model(Clowd,
      :name => "Name",
      :description => "MyText",
      :approvals => 1,
      :flags => 2,
      :status => 3,
      :icon => "Icon"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Icon/)
  end
end
