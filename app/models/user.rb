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
  #   def self.find_for_authentication(warden_conditions)
  #   without_soft_destroyed.where(email: warden_conditions[:email]).first
  # end

  # Deviseを使うと、問答無用でemailがユニーク扱いになる。
  # それだと論理削除した際に再登録できないので、一旦emailに関する検証を削除する
  # https://gist.github.com/brenes/4503386
  _validators.delete(:email)
  _validate_callbacks.each do |callback|
    if callback.raw_filter.respond_to? :attributes
      callback.raw_filter.attributes.delete :email
    end
  end

  # emailのバリデーションを定義し直す
  validates :email, presence: true
  validates_format_of :email, with: Devise.email_regexp, if: :email_changed?
  validates_uniqueness_of :email, scope: :soft_destroyed_at, if: :email_changed?



  has_many :carts, :dependent => :destroy
  has_many :histories, :dependent => :destroy
  has_one :goodbye
  validates :postal_code, presence: true, length: {maximum: 7, minimum: 7}, :numericality => :only_integer
  validates :phone_number, presence: true, length: {minimum: 11}, :numericality => :only_integer
  validates :user_name_kana, presence: true, format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "は全角カタカナのみで入力して下さい"
                 }
end
