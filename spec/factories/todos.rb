FactoryGirl.define do
  factory :todo do
    sequence :name do |index|
      "#{Faker::Commerce.department} #{index}"
    end

    project
  end
end
