# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    birthday { '20200131' }
    phone { '(+57) 320-432-05-09' }
    address { Faker::Address.full_address }
    credit_card_number { 'nkAjl+a3yTNGvI+G24A29k7G--Rn68LnmCH42zjX7a--JhOynoR3aThK04cFETDAEQ==' }
    credit_card_network { 'Discover' }
    credit_card_last_for_digit { '1234' }
    email { Faker::Internet.email }
    user
  end
end
