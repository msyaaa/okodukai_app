require 'rails_helper'

RSpec.describe Income, type: :model do
  describe Income do
    before do
      @income = FactoryBot.build(:income)
    end
    describe '貯金機能' do
      context '貯金がうまくいくとき' do
        it 'price、description、dateが存在すれば登録できること' do
          expect(@income).to be_valid
        end
        it '貯金額が0~9999999の間であること' do
          @income.price = 11_111
          expect(@income).to be_valid
        end
      end

      context '貯金がうまくいかないとき' do
        it 'priceが空では登録できないこと' do
          @income.price = nil
          @income.valid?
          expect(@income.errors.full_messages).to include('金がくを入力してください')
        end
        it 'priceが0未満であれば保存できない' do
          @income.price = -1
          @income.valid?
          expect(@income.errors.full_messages).to include('金がくは0より大きい値にしてください')
        end
        it 'priceが9999999より大きければ保存できない' do
          @income.price = 10_000_000
          @income.valid?
          expect(@income.errors.full_messages).to include('金がくは10000000より小さい値にしてください')
        end
        it 'descriptionが空では登録できないこと' do
          @income.description = nil
          @income.valid?
          expect(@income.errors.full_messages).to include('メモを入力してください')
        end
        it 'メモが51文字以上の時は登録できない' do
          @income.description = Faker::Lorem.paragraphs(number: 50)
          @income.valid?
          expect(@income.errors.full_messages).to include('メモは50文字以内で入力してください')
        end
        it 'dateが空では登録できないこと' do
          @income.date = nil
          @income.valid?
          expect(@income.errors.full_messages).to include('日づけを入力してください')
        end
      end
    end
  end
end
