class PurchaseRecordsController < ApplicationController
  before_action :move_to_sing_in
  before_action :item_find, only: [:index, :create]

  def index
    if @item.user_id == current_user.id || @item.purchase_record != nil
      redirect_to root_path
    else
      @purchase = PurchaseRecordAddresse.new
    end
  end

  def create
    @purchase = PurchaseRecordAddresse.new(purchase_params)
    if @purchase.valid?

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  #PAY.JPテスト秘密鍵
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

   def move_to_sing_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

end
