class CreatePortfolioItems < ActiveRecord::Migration
  def change
    create_table :portfolio_items do |t|
      t.string :title
      t.text :body
      t.string :featured_image

      t.timestamps
    end
  end
end
