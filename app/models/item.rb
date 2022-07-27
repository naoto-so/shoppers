class Item < ApplicationRecord
  has_one_attached :image

  validates :item,    presence: true
  validates :explain, presence: true
  validates :price,   presence: true
  validates :image,   presence: true
end
