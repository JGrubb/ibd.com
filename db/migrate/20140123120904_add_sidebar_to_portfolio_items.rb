class AddSidebarToPortfolioItems < ActiveRecord::Migration
  def change
    add_column :portfolio_items, :sidebar, :text
  end
end
