class Item < ApplicationRecord
  has_one_attached :image
  has_one :order

  validates :item,    presence: true
  validates :explain, presence: true
  validates :price,   presence: true
  validates :image,   presence: true
end
