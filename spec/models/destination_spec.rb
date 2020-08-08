require 'rails_helper'


describe Destination do
  describe '#create' do
    it "姓名全角、姓名全角カナ、郵便番号、都道府県、市区町村、番地が入力されていれば登録できること" do
      user = create(:user)
      destination = build(:destination)
      expect(destination).to be_valid
    end
    it "ユーザーが存在しなければ登録できないこと" do
      destination = build(:destination)
      destination.valid?
      expect(destination.errors[:user]).to include("を入力してください")
    end
    it "姓が空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_family_name: "")
      destination.valid?
      expect(destination.errors[:destination_family_name]).to include("を入力してください")
    end
    it "名が空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_first_name: "")
      destination.valid?
      expect(destination.errors[:destination_first_name]).to include("を入力してください")
    end
    it "姓カナが空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_family_name_kana: "")
      destination.valid?
      expect(destination.errors[:destination_family_name_kana]).to include("を入力してください")
    end
    it "名カナが空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_family_name_kana: "")
      destination.valid?
      expect(destination.errors[:destination_family_name_kana]).to include("を入力してください")
    end
    it "姓が全角以外では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_family_name: "ﾀﾅｶ")
      destination.valid?
      expect(destination.errors[:destination_family_name]).to include("は全角で入力してください。")
    end
    it "名が全角以外では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_first_name: "ｼﾞﾛｳ")
      destination.valid?
      expect(destination.errors[:destination_first_name]).to include("は全角で入力してください。")
    end
    it "姓カナが全角カタカナ以外では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_family_name_kana: "田中")
      destination.valid?
      expect(destination.errors[:destination_family_name_kana]).to include("は全角カタカナのみで入力してください。")
    end
    it "名カナが全角カタカナ以外では登録できないこと" do
      user = create(:user)
      destination = build(:destination, destination_family_name_kana: "次郎")
      destination.valid?
      expect(destination.errors[:destination_family_name_kana]).to include("は全角カタカナのみで入力してください。")
    end
    it "Post codeが空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, post_code: "")
      destination.valid?
      expect(destination.errors[:post_code]).to include("を入力してください")
    end
    it "Prefectureが空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, prefecture: "")
      destination.valid?
      expect(destination.errors[:prefecture]).to include("を入力してください")
    end
    it "Cityが空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, city: "")
      destination.valid?
      expect(destination.errors[:city]).to include("を入力してください")
    end
    it "Addressが空では登録できないこと" do
      user = create(:user)
      destination = build(:destination, address: "")
      destination.valid?
      expect(destination.errors[:address]).to include("を入力してください")
    end
  end
end