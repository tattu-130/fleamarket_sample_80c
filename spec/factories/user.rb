FactoryBot.define do

  factory :user do
    id                              { 1 }
    nickname                        {"こうたろう"}
    password                        {"test1019"}
    password_confirmation           {"test1019"}
    email                           {"kotaro@gmail.com"}
    first_name                      {"幸太郎"}
    family_name                     {"齋藤"}
    first_name_kana                 {"コウタロウ"}
    family_name_kana                {"サイトウ"}
    birth_year                      {"1984"}
    birth_month                     {"10"}
    birth_day                       {"19"}
  end

end