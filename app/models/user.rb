class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :kanji_last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_first_name2, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
