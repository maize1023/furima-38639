class PurchaseRecordsController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = PurchaseRecordAddresse.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase = PurchaseRecordAddresse.new(purchase_params)
    if @purchase.valid?

      Payjp.api_key = "sk_test_46f062606e89a928a5429354"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def purchase_params
    params.require(:purchase_record_addresse).permit(:from_id, :town, :street, :building, :phone, :post_code).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


end
