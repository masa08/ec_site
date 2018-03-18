class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :histories
  validates :postal_code, presence: true, length: {maximum: 7, minimum: 7}, :numericality => :only_integer
  validates :phone_number, length: {minimum: 11}, :numericality => :only_integer
  validates :email, length: {minimum: 10}
  validates :user_name_kana, presence: true, format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "全角カタカナのみで入力して下さい"
                 }
end
