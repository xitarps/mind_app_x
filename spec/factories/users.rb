FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "tester_#{n.to_s.rjust(3, '0')}@tester.com" }
    password { '123456' }
  end
end
