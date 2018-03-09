class Cart < ApplicationRecord
    has_many :item_carts

    has_many :histories

end
