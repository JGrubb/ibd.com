# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.ignoredbydinosaurs.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  Post.find_each do |post|
    add post_date_path(post.year, post.month, post.slug), :lastmod => post.updated_at
  end
  PortfolioItem.find_each do |port|
    add portfolio_item_path(port), :lastmod => port.updated_at
  end
end