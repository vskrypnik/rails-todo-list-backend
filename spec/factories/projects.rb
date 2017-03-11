FactoryGirl.define do
  factory :project do
    sequence :name do |index|
      "#{Faker::Commerce.department} #{index}"
    end

    user

    factory :project_with_todos do
      transient { todos_count 4 }

      after(:create) do |project, evaluator|
        create_list(:todo, evaluator.todos_count, project: project)
      end
    end
  end
end
