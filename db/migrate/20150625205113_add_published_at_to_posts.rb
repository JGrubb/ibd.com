class AddPublishedAtToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :published_at, :datetime
    add_index :posts, :published_at
  end

  def down
    remove_column :posts, :published_at
  end 
end
