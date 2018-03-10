class Cart < ApplicationRecord
    has_many :item_carts
    belongs_to :user
end
