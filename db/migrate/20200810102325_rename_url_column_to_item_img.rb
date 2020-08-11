class RenameUrlColumnToItemImg < ActiveRecord::Migration[6.0]
  def change
    rename_column :item_imgs, :url, :src
  end
end
