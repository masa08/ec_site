class Cart < ApplicationRecord
    has_many :item_carts, :dependent => :destroy
    belongs_to :user

    attachment :jacket_image

end
