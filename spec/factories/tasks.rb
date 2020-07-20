FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'RSpecなどなどを準備する' }
    user
  end
end