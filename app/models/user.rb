class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  # 大文字小文字を区別しない
  validates :nickname, presence: true, uniqueness: { case_sensitive:  true }

  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナのみで入力してください。' }
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: 'は全角カタカナのみで入力してください。' }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  
  has_many :items
  # belongs_to :destination, optional: true
  has_one :destination
end
