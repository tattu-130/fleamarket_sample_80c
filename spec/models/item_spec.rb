require 'rails_helper'


describe Item do
  describe '#create' do
    it "商品名、商品の説明、価格、商品の状態、配送料の負担、発送元の地域、発送までの日数、画像の投稿があれば出品できること" do
      user = create(:user)
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end
    it "ユーザーが存在しなければ登録できないこと" do
      item = build(:item)
      item.valid?
      expect(item.errors[:user]).to include("を入力してください")
    end
    it "商品名が空では登録できないこと" do
      user = create(:user)
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "商品名がが40文字を超える場合は登録できないこと" do
      user = create(:user)
      item = build(:item, name: "12345678911234567891123456789112345678911")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end
    it "商品の説明が空では登録できないこと" do
      user = create(:user)
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include("を入力してください")
    end
    it "価格が空では登録できないこと" do
      user = create(:user)
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    it "商品の状態が空では登録できないこと" do
      user = create(:user)
      item = build(:item, item_condition: "")
      item.valid?
      expect(item.errors[:item_condition]).to include("を入力してください")
    end
    it "配送料の負担が空では登録できないこと" do
      user = create(:user)
      item = build(:item, postage: "")
      item.valid?
      expect(item.errors[:postage]).to include("を入力してください")
    end
    it "発送元の地域が空では登録できないこと" do
      user = create(:user)
      item = build(:item, prefecture: "")
      item.valid?
      expect(item.errors[:prefecture]).to include("を入力してください")
    end
    it "発送までの日数が空では登録できないこと" do
      user = create(:user)
      item = build(:item, delivery_days: "")
      item.valid?
      expect(item.errors[:delivery_days]).to include("を入力してください")
    end
  end
end
