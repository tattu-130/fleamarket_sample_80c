# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false, unique: true, index: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|string|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|introduction|text|-|
|user_image|string|-|

### Association
- has_many :items
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- belongs_to :destinations
- belongs_to :credit_cards

## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|-|
|phone_number|string|-|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|item_condition|string|null:false|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|postage|integer|null: false, default: 0|
|post_code|integer(7)|null: false|
|delivery_days|integer|null: false|
|created_at|datetime|null: false|
|user_id|references|null: false, foreign_key: true|
|seller|boolean|null: false|
|buyer|boolean|

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_imgs, dependent: :destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :items


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :items


## item_imgsテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|src|string|null: false|

### Association
- belongs_to :item


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :user
- belongs_to :item


## favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item