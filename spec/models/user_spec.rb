require 'rails_helper'

describe User do
  describe '#create' do
    it "Nickname,Emaill,Password,お名前（全角）,お名前カナ（全角）生年月日が入力されていれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "Nicknameが空では登録できないこと" do
      user = build(:user, nickname:"")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailが空では登録できないこと" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "passwordが空では登録できないこと" do
      user = build(:user, 'password': "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end
    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, 'password': "1234567", password_confirmation: "1234567")
      expect(user).to be_valid
    end
    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, 'password': "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "姓が空では登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "名が空では登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end
    it "姓カナが空では登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "名カナが空では登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
    it "姓が全角以外では登録できないこと" do
      user = build(:user, first_name: "ﾀﾅｶ")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角で入力してください。")
    end
    it "名が全角以外では登録できないこと" do
      user = build(:user, family_name: "ｼﾞﾛｳ")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力してください。")
    end
    it "姓カナが全角カタカナ以外では登録できないこと" do
      user = build(:user, first_name_kana: "田中")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナのみで入力してください。")
    end
    it "名カナが全角カタカナ以外では登録できないこと" do
      user = build(:user, family_name_kana: "次郎")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナのみで入力してください。")
    end
    it "生年が空では登録できないこと" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end
    it "生月が空では登録できないこと" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end
    it "生日が空では登録できないこと" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
  end
end