require 'spec_helper'

describe Post do
  it "is valid with a title" do
    post = Post.new(title: "The title")
    expect(post).to be_valid
  end

  it "is invalid without a title" do
    post = Post.new
    expect(post).to be_invalid
  end

  describe "Date methods" do
    before :each do
      @post = Post.new(title: "the title", created_at: "2014-02-04 07:07:53 -0500", published: true)
    end

    it "returns the post's month as a 2 character string" do
      expect(@post.month).to eq("02")
    end

    it "returns the post's year as a 4 character string" do
      expect(@post.year).to eq("2014")
    end
  end

  describe "Tag methods" do
    before :each do
      @post = create :post_with_tags
    end

    it "correctly parses the tag_list" do
      expect(@post.tags.count).to eq(3)
    end

    it "finds posts by tag" do
      expect(Post.tagged_with('this').count).to eq(1)
    end
  end
end
