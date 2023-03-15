# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@factory.com" }
    sequence(:username) { |n| "username#{n}" }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
