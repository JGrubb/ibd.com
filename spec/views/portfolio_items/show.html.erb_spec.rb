require 'spec_helper'

describe "portfolio_items/show" do
  before(:each) do
    @portfolio_item = assign(:portfolio_item, stub_model(PortfolioItem,
      :title => "Title",
      :body => "Body",
      :featured_image => "Featured Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Body/)
    rendered.should match(/Featured Image/)
  end
end
