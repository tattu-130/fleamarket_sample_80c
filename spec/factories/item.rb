FactoryBot.define do

  factory :item do
    name                           {"本"}
    detail                         {"本の説明です"}
    price                          {"980"}
    item_condition                 { 1 }
    postage                        { 1 }
    delivery_days                  { 1 }
    prefecture                     { 1 }
    seller                         { 1 }
    user_id                        { 1 }
    # user                 {create(:user)}

    after(:build) do |item|
      item.item_imgs << build(:item_img, item: item)
    end
  end  
end
