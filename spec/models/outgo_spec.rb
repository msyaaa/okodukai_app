require 'rails_helper'

RSpec.describe Outgo, type: :model do
  describe Outgo do
    before do
      @outgo = FactoryBot.build(:outgo)
    end
    describe '浪費機能' do
      context '浪費がうまくいくとき' do
        it 'price、description、dateが存在すれば登録できること' do
          expect(@outgo).to be_valid
        end
        it '浪費額が0~9999999の間であること' do
          @outgo.price = 11_111
          expect(@outgo).to be_valid
        end
      end

      context '浪費がうまくいかないとき' do
        it 'priceが空では登録できないこと' do
          @outgo.price = nil
          @outgo.valid?
          expect(@outgo.errors.full_messages).to include('金がくを入力してください')
        end
        it 'priceが0未満であれば保存できない' do
          @outgo.price = -1
          @outgo.valid?
          expect(@outgo.errors.full_messages).to include('金がくは0より大きい値にしてください')
        end
        it 'priceが9999999より大きければ保存できない' do
          @outgo.price = 10_000_000
          @outgo.valid?
          expect(@outgo.errors.full_messages).to include('金がくは10000000より小さい値にしてください')
        end
        it 'descriptionが空では登録できないこと' do
          @outgo.description = nil
          @outgo.valid?
          expect(@outgo.errors.full_messages).to include('メモを入力してください')
        end
        it 'メモが51文字以上の時は登録できない' do
          @outgo.description = Faker::Lorem.paragraphs(number: 50)
          @outgo.valid?
          expect(@outgo.errors.full_messages).to include('メモは50文字以内で入力してください')
        end
        it 'dateが空では登録できないこと' do
          @outgo.date = nil
          @outgo.valid?
          expect(@outgo.errors.full_messages).to include('日づけを入力してください')
        end
      end
    end
  end
end
