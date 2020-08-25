require 'rails_helper'

describe Card do
  describe '#create' do
    it "user_idとcard_idとustomer_idがあれば登録できること" do
      user = create(:user)
      card = build(:card)
      expect(card).to be_valid
    end
    it "userがいなければ登録できないこと" do
      user = create(:user)
      card = build(:card, user_id: "")
      card.valid?
      expect(card.errors[:user_id]).to include("を入力してください")
    end
    it "customer_idがなければ登録できないこと" do
      user = create(:user)
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    it "card_idがなければ登録できないこと" do
      user = create(:user)
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end
