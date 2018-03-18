class Item < ApplicationRecord
  has_many :item_carts
  has_many :tunes
  has_many :item_genres
  has_many :purchases
  belongs_to :type, optional: true
  accepts_nested_attributes_for :item_genres
  attachment :jacket_image

  # 小野瀬サイドバー検証中
  scope :get_by_types_id, ->(types_id) {
  where(types_id: types_id)
  }
end
