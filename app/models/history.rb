class History < ApplicationRecord
	belongs_to :user
	belongs_to :payment
	belongs_to :delivery
	belongs_to :status
	has_many :items, through: :purchases
	has_many :purchases
end
