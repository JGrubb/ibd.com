require 'spec_helper'

describe "portfolio_items/edit" do
  before(:each) do
    @portfolio_item = assign(:portfolio_item, stub_model(PortfolioItem,
      :title => "MyString",
      :body => "MyString",
      :summary => "Stringish",
      :featured_image => "MyString"
    ))
  end

  it "renders the edit portfolio_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", portfolio_item_path(@portfolio_item), "post" do
      assert_select "input#portfolio_item_title[name=?]", "portfolio_item[title]"
      assert_select "textarea#portfolio_item_body[name=?]", "portfolio_item[body]"
      assert_select "textarea#portfolio_item_summary[name=?]", "portfolio_item[summary]"
      assert_select "input#portfolio_item_featured_image[name=?]", "portfolio_item[featured_image]"
    end
  end
end
