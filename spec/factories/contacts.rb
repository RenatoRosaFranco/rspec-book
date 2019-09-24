# frozen_string_literal: true

FactoryBot.define do
	
  factory :contact do
    firstname { "John" }
    lastname { "Doe" }
    email { 'johndoe@gmail.com' }
  end

  factory :smith, class: Contact do
  	firstname { 'John' }
  	lastname { 'Smith' }
  	email { 'jsmith@example.com' }
  end

  factory :jones, class: Contact do
  	firstname { 'Tim' }
  	lastname { 'Jones' }
  	email { 'tjones@example.com' }
  end

  factory :johnson, class: Contact do
  	firstname { 'John' }
  	lastname { 'Johnson' }
  	email { 'jjohnson@example.com' }
  end
end
