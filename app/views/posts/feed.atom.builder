atom_feed do |feed|
  feed.title "Ignored by Dinosaurs"
  feed.updated_at @posts.first.updated_at

  @posts.each do |post|
    feed.entry post, published: post.created_at do |entry|
      entry.title post.title
      entry.content markdown_filter(post.body), type: "html"
      entry.author "J Grubb"
    end
  end
end
