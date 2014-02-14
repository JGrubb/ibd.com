require 'spec_helper'

describe Tag do
  it "is valid with a name" do
    tag = Tag.new(name: "Testing")
    expect(tag).to be_valid
  end

  it "is invalid without a name" do
    tag = Tag.new
    expect(tag).to be_invalid
  end
end
