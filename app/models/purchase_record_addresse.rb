class PurchaseRecordAddresse
  # attr_accessor :token

  # 保存する前のデータを検証などの処理を実現できるのはActive Modelという仕組みがあるから。
  # include ActiveModel::Modelを記載しincludeすることで、モデルのように扱えてここにバリデーションの記載もできます！
  include ActiveModel::Model

  # attr_accessorを用いて、保存したい複数のテーブルのカラム名すべてを扱えるようにする
  # attr_accessorはメソッド内の記述をメソッド外の時に変更を加えれるようにできるメソッドです！つまりインスタンス変数として扱えるようになり、ゲッターとセッターの内部処理を行っています！
  attr_accessor :user_id, :item_id, :post_code, :from_id, :town, :street, :building, :phone, :purchase_record_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :from_id
    validates :town
    validates :street
    validates :building
    validates :phone, format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    # saveの前に行う
    # validates :purchase_record_id
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Addresse.create(post_code: post_code, from_id: from_id, town: town, street: street, building: building, phone: phone, purchase_record_id: purchase.id)
  end
end
