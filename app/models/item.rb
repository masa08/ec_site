class Item < ApplicationRecord
  has_many :item_carts
  has_many :tunes
  has_many :item_genres
  has_many :purchases
  belongs_to :type, optional: true

  attachment :jacket_image
end
