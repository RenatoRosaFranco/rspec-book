FactoryBot.define do
  factory :phone do
    phone_type { "MyString" }
    phone_number { "MyString" }
    contact { nil }
  end
end
