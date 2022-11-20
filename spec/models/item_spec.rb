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


    context '商品出品ができない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが未選択では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'fee_idが未選択では登録できない' do
        @item.fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Fee can't be blank"
      end
      it 'from_idが未選択では登録できない' do
        @item.from_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "From can't be blank"
      end
      it 'day_idが未選択では登録できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格は、¥300~¥9,999,999の間でなければ保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end

      it '価格は半角数値でなければ保存できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end

      it '商品画像がない場合は保存ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it 'ユーザーが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end

    end










  end
end
