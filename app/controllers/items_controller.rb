class ItemsController < ApplicationController
  before_action :move_to_sing_in, except: [:index, :show,]
  before_action :set_item, only: [:show, :edit, :update]


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  # データ保存したtきはトップページに、失敗したら出品ページに留まる&エラーメッセージ&情報保持
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
   else
      render :new
   end
  end

  def edit

    if @item.purchase_record == nil
      if @item.user_id != current_user.id
        redirect_to root_path
      end
    else
      redirect_to root_path
    end

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
       item.destroy
    end
    redirect_to root_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id,  :condition_id, :fee_id, :from_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_sing_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
