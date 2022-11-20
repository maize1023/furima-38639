require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
      @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
        it '全ての必須項目が記入されている' do
          expect(@item).to be_valid
        end
    end


    # context '商品出品ができない場合' do
    #   it 'nameが空では登録できない' do
    #     @item.name = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "Name can't be blank"
    #   end
    #   it 'descriptionが空では登録できない' do
    #     @item.description = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "Description can't be blank"
    #   end
    #   it 'category_idが空では登録できない' do
    #     @item.category_id = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "Category id can't be blank"
    #   end
    #   it 'condition_idが空では登録できない' do
    #     @item.condition_id = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "Condition id can't be blank"
    #   end
    #   it 'fee_idが空では登録できない' do
    #     @item.fee_id = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "Fee id can't be blank"
    #   end
    #   it 'from_idが空では登録できない' do
    #     @item.from_id = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "From id can't be blank"
    #   end
    #   it 'day_idが空では登録できない' do
    #     @item.day_ide = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "Day id can't be blank"
    #   end
    #   it 'priceが空では登録できない' do
    #     @item.price = ''
    #     @item.valid?
    #     expect(@item.errors.full_messages).to include "Price can't be blank"
    #   end

    # end










  end
end
