require 'rails_helper'

RSpec.describe User, type: :model do
   before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
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
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name= ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Kana first name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end

      context 'ユーザーが登録できる場合' do
        it '全ての必須項目が記入されている' do
          @user.kanji_last_name = '田所'
          @user.kana_first_name2 = '武蔵'
          @user.kana_last_name = 'タドコロ'
          @user.kana_first_name = 'タケゾウ'
          expect(@user).to be_valid
        end
      end
  end
end
