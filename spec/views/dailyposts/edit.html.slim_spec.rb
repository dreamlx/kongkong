require 'spec_helper'

describe "dailyposts/edit" do
  before(:each) do
    @dailypost = assign(:dailypost, stub_model(Dailypost,
      :girl_id => 1,
      :content => "MyText",
      :photo => "MyString",
      :linkto => "MyString"
    ))
  end

  it "renders the edit dailypost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dailypost_path(@dailypost), "post" do
      assert_select "input#dailypost_girl_id[name=?]", "dailypost[girl_id]"
      assert_select "textarea#dailypost_content[name=?]", "dailypost[content]"
      assert_select "input#dailypost_photo[name=?]", "dailypost[photo]"
      assert_select "input#dailypost_linkto[name=?]", "dailypost[linkto]"
    end
  end
end
