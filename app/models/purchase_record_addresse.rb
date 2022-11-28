class PurchaseRecordAddresse

  include ActiveModel::Model


  attr_accessor :user_id, :item_id, :post_code, :from_id, :town, :street, :building, :phone, :purchase_record_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :from_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :town
    validates :street
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A\d{10,11}\z/}

    validates :token
  end

  def save
    purchase = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Addresse.create(post_code: post_code, from_id: from_id, town: town, street: street, building: building, phone: phone, purchase_record_id: purchase.id)
  end
end
