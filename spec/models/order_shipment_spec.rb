require 'rails_helper'

RSpec.describe OrderShipment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipment = FactoryBot.build(:order_shipment, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必須項目を全て正しい形で埋めれば登録できる' do
        expect(@order_shipment).to be_valid
      end
      it '建物名は空でも登録できる' do
        @order_shipment.building = ''
        expect(@order_shipment).to be_valid
      end
    end
    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @order_shipment.zip_code = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "Zip code can't be blank"
      end
      it '郵便番号が3桁-4桁でないと登録できない' do
        @order_shipment.zip_code = '1234567'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include 'Zip code is invalid. Include hyphen(-)'
      end
      it '都道府県が空では登録できない' do
        @order_shipment.prefecture_id = 0
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空では登録できない' do
        @order_shipment.city = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では登録できない' do
        @order_shipment.branch = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "Branch can't be blank"
      end
      it '電話番号が空では登録できない' do
        @order_shipment.phone = ''
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "Phone can't be blank"
      end
      it '電話番号が9桁以下では登録できない' do
        @order_shipment.phone = '000111222'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include 'Phone is invalid'
      end
      it '電話番号が12桁以上では登録できない' do
        @order_shipment.phone = '000111222333'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include 'Phone is invalid'
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_shipment.phone = '000-111-222'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include 'Phone is invalid'
      end
      it 'userが紐づいていなければ登録できない' do
        @order_shipment.user_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐づいていなければ登録できない' do
        @order_shipment.item_id = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空では登録できない' do
        @order_shipment.token = nil
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
