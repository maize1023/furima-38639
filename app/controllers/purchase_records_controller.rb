class PurchaseRecordsController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = PurchaseRecordAddresse.new
  end

  def create

  end
end
