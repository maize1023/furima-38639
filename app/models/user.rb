class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :kanji_last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/}
  validates :kana_first_name2, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }


  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: {with: VALID_PASSWORD_REGEX}

  has_many :items
end
