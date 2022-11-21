class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, presence: true,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :from_id, presence: true,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, presence: true,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true

  validates :price, presence: true,        numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user
  # has_one_attached :purchase


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :fee
  belongs_to_active_hash :from
  belongs_to_active_hash :day

end
