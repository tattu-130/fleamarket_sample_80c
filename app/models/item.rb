class Item < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :category
  has_many :item_imgs, dependent: :destroy
  has_many :comments, dependent: :destroy
  # belongs_to :user, class_name: 'User', foreign_key: 'buyer_id', optional: true
  accepts_nested_attributes_for :item_imgs, allow_destroy: true

  with_options presence: true do
    validates :name,            length: { maximum: 40 }
    validates :detail
    validates :price
    validates :category_id
    validates :item_condition
    validates :postage
    validates :prefecture
    validates :delivery_days
    validates :item_imgs,       length: { minimum: 1, maximum: 10, message: 'は1枚以上10枚以下の範囲で登録してください' }
  end


  enum prefecture: {
    "北海道":1,"青森県":2,"岩手県":3,"宮城県":4,"秋田県":5,"山形県":6,"福島県":7,
    "茨城県":8,"栃木県":9,"群馬県":10,"埼玉県":11,"千葉県":12,"東京都":13,"神奈川県":14,
    "新潟県":15,"富山県":16,"石川県":17,"福井県":18,"山梨県":19,"長野県":20,
    "岐阜県":21,"静岡県":22,"愛知県":23,"三重県":24,
    "滋賀県":25,"京都府":26,"大阪府":27,"兵庫県":28,"奈良県":29,"和歌山県":30,
    "鳥取県":31,"島根県":32,"岡山県":33,"広島県":34,"山口県":35,
    "徳島県":36,"香川県":37,"愛媛県":38,"高知県":39,
    "福岡県":40,"佐賀県":41,"長崎県":42,"熊本県":43,"大分県":44,"宮崎県":45,"鹿児島県":46,"沖縄県":47
  }

  enum delivery_days: {"１〜２日で発送": 0, "２〜３で発送": 1, "４〜７で発送": 2}

  enum postage: {"送料込み（出品者負担）": 0, "着払い（購入者負担）": 1}

  enum item_condition: {
    "新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5
  }

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
