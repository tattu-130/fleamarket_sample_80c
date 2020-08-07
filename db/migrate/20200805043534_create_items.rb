class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :detail
      t.integer :price
      t.string :item_condition
      t.integer :postage
      t.integer :post_code
      t.integer :delivery_days
      t.timestamps
    end
  end
endral
