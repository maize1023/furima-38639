require 'rails_helper'

RSpec.describe PurchaseRecordAddresse, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_addresse = FactoryBot.build(:purchase_record_addresse, user_id: user.id, item_id: item.id)
    end

    context '必須項目が全て入力されている場合' do
      it '必須項目の値が正しく入力されていれば保存できること' do
        expect(@purchase_record_addresse).to be_valid
      end
      it 'buildingは空でも保存できること' do
      end
    end

    context '入力に不備がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_record_addresse.post_code = ''
        @purchase_record_addresse.valid?
        expect(@purchase_record_addresse.errors.full_messages).to include("Post code can't be blank")
      end
      it 'from_idが空だとでないと保存できないこと' do
        @purchase_record_addresse.from_id = ''
        @purchase_record_addresse.valid?
        expect(@purchase_record_addresse.errors.full_messages).to include("From can't be blank")
      end
      it 'townが空だと保存できないこと' do
        @purchase_record_addresse.town = ''
        @purchase_record_addresse.valid?
        expect(@purchase_record_addresse.errors.full_messages).to include("Town can't be blank")
      end
      it 'streetが空だと保存できないこと' do
        @purchase_record_addresse.street = ''
        @purchase_record_addresse.valid?
        expect(@purchase_record_addresse.errors.full_messages).to include("Street can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @purchase_record_addresse.phone = ''
        @purchase_record_addresse.valid?
        expect(@purchase_record_addresse.errors.full_messages).to include("Phone can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_record_addresse.token = ''
        @purchase_record_addresse.valid?
        expect(@purchase_record_addresse.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
