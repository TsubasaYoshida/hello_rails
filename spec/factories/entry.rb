FactoryBot.define do
  factory :entry do
    title "エントリーのタイトル"
    body "エントリーの本文"
    association :blog, factory: :blog
  end
end