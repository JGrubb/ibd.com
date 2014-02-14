require 'spec_helper'

describe Tagging do

  it "is valid with a tag_id and a post_id" do
    tagging = Tagging.new(tag_id: 1, post_id: 1)
    expect(tagging).to be_valid
  end

end
