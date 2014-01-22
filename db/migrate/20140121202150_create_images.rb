class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption
      t.string :image
      t.references :portfolio_item

      t.timestamps
    end
    add_index :images, :portfolio_item_id
  end
end
