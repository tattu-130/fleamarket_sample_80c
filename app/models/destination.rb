class Destination < ApplicationRecord

  validates :destination_first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
  validates :destination_family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
  validates :destination_first_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナのみで入力してください。' }
  validates :destination_family_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナのみで入力してください。' }
  validates :post_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true

  belongs_to :user, optional: true
end
