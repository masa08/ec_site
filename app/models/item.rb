class Item < ApplicationRecord
  has_many :item_carts
  has_many :tunes
  has_many :item_genres
  has_many :purchases
  belongs_to :type, optional: true
  accepts_nested_attributes_for :item_genres
  attachment :jacket_image


end
