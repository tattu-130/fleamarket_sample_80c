class Item < ApplicationRecord
  belongs_to :user, category
  has_many :item_imgs, dependent: :destroy
  accepts_nested_attributes_for :item_imgs, allow_destroy: true
end
