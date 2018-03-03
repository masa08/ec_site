class Type < ApplicationRecord
  has_many :items
  accepts_attachments_for :items, attachment: :jacket_image

end
