class AddFullTextIndexToPosts < ActiveRecord::Migration
  def up
    execute "
        create index on posts using gin(to_tsvector('english', title));
        create index on posts using gin(to_tsvector('english', body));"
  end
  def down
    execute "
      drop index posts_to_tsvector_idx;
      drop index posts_to_tsvector_idx1;
    "
  end
end
