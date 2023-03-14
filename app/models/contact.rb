# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, name_format: true
  validates :birthday, presence: true, birthday_format: true
  validates :phone, presence: true
  validates :credit_card_number, presence: true
  validates :credit_card_network, presence: true
  validates :credit_card_last_for_digit, presence: true
  validates :email, presence: true
end
