class AddPrefectureToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :prefecture, :integer, null: false
  end
end
