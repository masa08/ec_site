class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   soft_deletable

  # Deviseの認証に関わる箇所
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    self.without_soft_destroyed.where(conditions.to_h).first
  end

  has_many :carts
  has_many :histories
  has_one :goodbye
  validates :postal_code, presence: true, length: {maximum: 7, minimum: 7}, :numericality => :only_integer
  validates :phone_number, presence: true, length: {minimum: 11}, :numericality => :only_integer
  validates :email, presence: true
  validates :user_name_kana, presence: true, format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "は全角カタカナのみで入力して下さい"
                 }
end
