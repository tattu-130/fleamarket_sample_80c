class ChangeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :detail, false
    change_column_null :items, :price, false
    change_column_null :items, :item_condition, false
    change_column_null :items, :postage, false
    change_column_null :items, :delivery_days, false
  end
end
