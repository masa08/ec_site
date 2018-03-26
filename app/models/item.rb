class Item < ApplicationRecord
  has_many :item_carts, :dependent => :destroy
  has_many :tunes, :dependent => :destroy
  has_many :item_genres, :dependent => :destroy
  has_many :purchases, :dependent => :destroy
  belongs_to :type, optional: true
  accepts_nested_attributes_for :item_genres
  accepts_nested_attributes_for :tunes, allow_destroy: true
  attachment :jacket_image
end
