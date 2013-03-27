

FactoryGirl.define do
  factory :message do
    association :room
    sequence(:text)  { |n| "test#{n}" }
    sequence(:room_id) {|n| "#{n}"}
  end

  factory :room do
    sequence(:name)  { |n| "green#{n}" }
    # sequence(:email) {|n| "person#{n}@example.com" }
  end
end