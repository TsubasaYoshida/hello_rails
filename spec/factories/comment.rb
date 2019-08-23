FactoryBot.define do
  factory :comment do
    body "コメントの本文"
    status "コメントのステータス"
    association :entry, factory: :entry
  end
end