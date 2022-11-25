class PurchaseRecordsController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = PurchaseRecordAddresse.new
  end

  def create
  #  PurchaseRecordAddresse.create(purchase_params)
    @purchase = PurchaseRecordAddresse.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
   else
    render :index
   end
  end


  private
  def purchase_params
    params.require(:purchase_record_addresse).permit(:from_id, :town, :street, :building, :phone, :post_code).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
