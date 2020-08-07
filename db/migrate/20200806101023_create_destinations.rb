class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :destination_first_name,             null: false
      t.string :destination_family_name,            null: false
      t.string :destination_first_name_kana,        null: false
      t.string :destination_family_name_kana,       null: false
      t.string :post_code,                          null: false
      t.string :prefecture,                         null: false
      t.string :city,                               null: false
      t.string :address,                            null: false
      t.string :building_name,                      null: false
      t.string :phone_number,                       null: false
      t.references :user,                           foreign_key: true
      t.timestamps
    end
  end
end
