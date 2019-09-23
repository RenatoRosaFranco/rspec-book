# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    firstname { "John" }
    lastname { "Doe" }
    sequence(:email) { |n| "Johndoe#{n}@example.com" }
  end
end
