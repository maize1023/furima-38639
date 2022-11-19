class Item < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :from_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :day_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true

  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :from
  belongs_to :day

end
