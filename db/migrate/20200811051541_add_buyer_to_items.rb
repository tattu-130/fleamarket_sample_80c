class AddBuyerToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :buyer, :boolean, default: false
  end
end
