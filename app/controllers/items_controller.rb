class ItemsController < ApplicationController
  before_action :move_to_sing_in, except: [:index]
  before_action :move_to_sing_in, except: [:index]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end


  # データ保存したtきはトップページに、失敗したら出品ページに留まる&エラーメッセージ&情報保持
  def create
    Item.create(item_params)
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
