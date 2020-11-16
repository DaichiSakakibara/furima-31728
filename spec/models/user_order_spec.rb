require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it "priceが空では登録できないこと" do
      @user_order.price = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Price can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_numberが空だと保存できないこと' do
      @user_order.post_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post number can't be blank")
    end
    it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.post_number = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
    end
    it '都道府県が未選択（1）だと登録できない' do
      @user_order.prefecture_id = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'municipalityが空だと保存できないこと' do
      @user_order.municipality = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'address_numberが空だと保存できないこと' do
      @user_order.address_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12桁だと保存できないこと' do
      @user_order.phone_number = "090123456789"
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can be up to 11 digits")
    end
  end
end