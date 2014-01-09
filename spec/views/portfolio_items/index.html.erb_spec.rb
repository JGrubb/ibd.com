require 'spec_helper'

describe "portfolio_items/index" do
  before(:each) do
    assign(:portfolio_items, [
      stub_model(PortfolioItem,
        :title => "Title",
        :body => "Body",
        :featured_image => "Featured Image"
      ),
      stub_model(PortfolioItem,
        :title => "Title",
        :body => "Body",
        :featured_image => "Featured Image"
      )
    ])
  end

  it "renders a list of portfolio_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Featured Image".to_s, :count => 2
  end
end
