class AddSummaryToPortfolioItems < ActiveRecord::Migration
  def change
    add_column :portfolio_items, :summary, :text
  end
end
