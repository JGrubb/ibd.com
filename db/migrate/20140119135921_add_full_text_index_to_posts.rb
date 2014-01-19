class AddFullTextIndexToPosts < ActiveRecord::Migration
  def change
    execute "
        create index on posts using gin(to_tsvector('english', title));
        create index on posts using gin(to_tsvector('english', body));"
  end
end
