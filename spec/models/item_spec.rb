require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/images/test_image.png')
  end

  describe '新規出品' do
    context '新規出品がうまくいくとき' do
      it '全ての情報がが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規出品がうまくかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品説明が空だと登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが未選択（1）だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が未選択（1）だと登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it '配送料の負担が未選択（1）だと登録できない' do
        @item.which_pay_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Which pay must be other than 1')
      end
      it '発送元の地域が未選択（1）だと登録できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefectures must be other than 1')
      end
      it '発送までの日数が未選択（1）だと登録できない' do
        @item.how_long_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('How long days must be other than 1')
      end
      it '販売価格が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が10000000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格が全角だと登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
