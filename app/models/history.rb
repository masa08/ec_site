class History < ApplicationRecord
	belongs_to :user
	belongs_to :payment
	belongs_to :delivery
	has_many :purchases
end
