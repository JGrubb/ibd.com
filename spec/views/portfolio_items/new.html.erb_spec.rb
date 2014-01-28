require 'spec_helper'

describe "portfolio_items/new" do
  before(:each) do
    assign(:portfolio_item, stub_model(PortfolioItem,
      :title => "MyString",
      :body => "MyString",
      :featured_image => "MyString",
      :summary => "MyString"
    ).as_new_record)
  end

  it "renders new portfolio_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", portfolio_items_path, "post" do
      assert_select "input#portfolio_item_title[name=?]", "portfolio_item[title]"
      assert_select "textarea#portfolio_item_body[name=?]", "portfolio_item[body]"
      assert_select "input#portfolio_item_featured_image[name=?]", "portfolio_item[featured_image]"
    end
  end
end
