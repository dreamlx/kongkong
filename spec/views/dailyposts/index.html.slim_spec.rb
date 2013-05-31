require 'spec_helper'

describe "dailyposts/index" do
  before(:each) do
    assign(:dailyposts, [
      stub_model(Dailypost,
        :girl_id => 1,
        :content => "MyText",
        :photo => "Photo",
        :linkto => "Linkto"
      ),
      stub_model(Dailypost,
        :girl_id => 1,
        :content => "MyText",
        :photo => "Photo",
        :linkto => "Linkto"
      )
    ])
  end

  it "renders a list of dailyposts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    assert_select "tr>td", :text => "Linkto".to_s, :count => 2
  end
end
