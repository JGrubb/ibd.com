class CreatingPolymorphicOnImages < ActiveRecord::Migration
  def up
    add_column :images, :imageable_type, :string, default: 'PortfolioItem'
    rename_column :images, :portfolio_item_id, :imageable_id
    add_index :images, :imageable_type
  end

  def down
    remove_index :images, :imageable_type
    rename_column :images, :imageable_id, :portfolio_item_id
    remove_column :images, :imageable_type
  end
end
