# frozen_string_literal: true

FactoryBot.define do

  factory :phone do
  	phone_type { 'home' }
  	phone_number { '(11) 997195-6599' }
   	association :contact
  end

  factory :home_phone, parent: :phone do
  	phone_type { 'home' }
 	end

 	factory :mobile_phone, parent: :phone do
 		phone_type { 'mobile' }
 	end
end
