FactoryBot.define do

  factory :destination do
    id                                  { 1 }
    destination_first_name              {"幸太郎"}
    destination_family_name             {"齋藤"}
    destination_first_name_kana         {"コウタロウ"}
    destination_family_name_kana        {"サイトウ"}
    post_code                           {"100-99999"}
    prefecture                          {"東京都"}
    city                                {"中央区"}
    address                             {"丸の内1-1-1"}
    # building_name                       {"新東京ビル４階"}
    # phone_number                        {"03-9999-9999"}
    user_id                             { 1 }
  end

end