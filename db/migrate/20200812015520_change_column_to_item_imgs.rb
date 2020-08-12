class ChangeColumnToItemImgs < ActiveRecord::Migration[6.0]
  def change
    change_column_null :item_imgs, :src, false
  end
end
