class AddSellerToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :seller, :boolean, default: true, null: false
  end
end
