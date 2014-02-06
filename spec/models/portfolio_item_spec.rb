require 'spec_helper'

describe PortfolioItem do
  it "is valid with a title" do
    portfolio_item = PortfolioItem.new(title: "Test portfolio Item")
    expect(portfolio_item).to be_valid
  end

  it "is invalid without a title" do
    portfolio_item = PortfolioItem.new
    expect(portfolio_item).to be_invalid
  end
end
