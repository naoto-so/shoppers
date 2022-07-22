class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :kana
    validates :tel, format: { with: /\A\d{10,11}\z/ }
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー 　]+\z/ }, allow_blank: true do # かな・カナ・漢字・半角スペース・全角スペース
    validates :name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー 　]+\z/ }, allow_blank: true do # カナ・半角スペース・全角スペース
    validates :kana
  end
end
