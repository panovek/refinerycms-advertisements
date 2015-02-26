
FactoryGirl.define do
  factory :advertisement, :class => Refinery::Advertisements::Advertisement do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

