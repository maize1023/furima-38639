class PurchaseRecordAddresse

  # 保存する前のデータを検証などの処理を実現できるのはActive Modelという仕組みがあるから。
  # include ActiveModel::Modelを記載しincludeすることで、モデルのように扱えてここにバリデーションの記載もできます！
  include ActiveModel::Model

  # attr_accessorを用いて、保存したい複数のテーブルのカラム名すべてを扱えるようにする
  # attr_accessorはメソッド内の記述をメソッド外の時に変更を加えれるようにできるメソッドです！つまりインスタンス変数として扱えるようになり、ゲッターとセッターの内部処理を行っています！
  attr_accessor :user_id, :item_id, :post_code, :from_id, :town, :street, :building, :phone, :post_code, :purchase_record_id

  validates :user_id, presence: true
  validates :item_id, presence: true

  validates :post_code, presence: true
  validates :from_id, presence: true
  validates :town, presence: true
  validates :street, presence: true
  validates :building, presence: true
  validates :phone, presence: true
  validates :post_code, presence: true
  validates :purchase_record_id, presence: true


  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase_record.create(user_id: user_id, item_id: item_id)
    Addresse.create(post_code: post_code, from_id: from_id, town: town, street: street, building: building, phone: phone, post_code: post_code, purchase_record_id: purchase_record_id)
  end
end
