require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nickname、passwordとpassword_confirmationが存在すれば登録できること' do
          expect(@user).to be_valid
        end
        it 'passwordが６文字以上あれば登録できること' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('ニックネームを入力してください')
        end
        it '重複したnicknameが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, nickname: @user.nickname)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('ニックネームはすでに存在します')
        end
        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードを入力してください')
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
        end
        it 'passwordが５文字以下であれば登録できないこと' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end
      end
    end
  end
end
