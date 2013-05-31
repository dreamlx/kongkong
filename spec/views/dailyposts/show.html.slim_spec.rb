require 'spec_helper'

describe "dailyposts/show" do
  before(:each) do
    @dailypost = assign(:dailypost, stub_model(Dailypost,
      :girl_id => 1,
      :content => "MyText",
      :photo => "Photo",
      :linkto => "Linkto"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Photo/)
    rendered.should match(/Linkto/)
  end
end
