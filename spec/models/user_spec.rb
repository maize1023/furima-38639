require 'rails_helper'

RSpec.describe User, type: :model do
   before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
    context 'ユーザーが登録できる場合' do
        it '全ての必須項目が記入されている' do
          expect(@user).to be_valid
        end
    end
    context 'ユーザー登録ができない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it 'kanji_last_nameが空では登録できない' do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kanji last name can't be blank"
      end
      it 'kana_first_name2が空では登録できない' do
        @user.kana_first_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name2 can't be blank"
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name can't be blank"
      end
      it 'kana_last_nameが、漢字やひらがなでは登録できない' do
        @user.kana_last_name = '岩た'
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana last name is invalid"
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end
      it 'kana_first_nameが、漢字やひらがなでは登録できない' do
        @user.kana_first_name = '大き'
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name is invalid"
      end
      it 'emailが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
       it 'emailが重複して登録できない' do
        user1 = @user
        user1.save
        @user.valid?
        end

       it 'emailに@が含まれていない' do
        @user.email = '111gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
       it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
       it 'passwordは、6文字以上でないと登録できない' do
        @user.password = '666'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
       it 'passwordは、password_confirmationと一致していないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

       it 'passwordは、英字のみでは登録できない' do
        @user.password= 'eeeeee'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
       it 'passwordは、数字のみでは登録できない' do
        @user.password = '777777'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
       it 'passwordは、全角では登録できない' do
        @user.password = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

    end
  end
end
