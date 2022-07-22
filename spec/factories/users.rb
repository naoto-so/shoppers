FactoryBot.define do
  factory :user do
    name                  { Faker::Japanese::Name.name } # 漢字・かな・カナ
    kana                  { 'セイ メイ' } # カナ
    email                 { Faker::Internet.free_email }
    tel                   { '09011112222' }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end