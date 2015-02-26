
FactoryGirl.define do
  factory :category, :class => Refinery::Advertisements::Category do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

