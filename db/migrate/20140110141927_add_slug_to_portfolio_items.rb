class AddSlugToPortfolioItems < ActiveRecord::Migration
  def change
    add_column :portfolio_items, :slug, :string
    add_index :portfolio_items, :slug
  end
end
