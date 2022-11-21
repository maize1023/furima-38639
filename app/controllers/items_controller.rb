class ItemsController < ApplicationController
  before_action :move_to_sing_in, except: [:index]




  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  # def show
  #   @item = Item.find(item_params)
  # end


  # データ保存したtきはトップページに、失敗したら出品ページに留まる&エラーメッセージ&情報保持
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
   else
      render :new
   end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id,  :condition_id, :fee_id, :from_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_sing_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
